#include <stdio.h>
#include <stdint.h>

#define SCALE 8
#define K0 37
#define K1 109
#define K2 109
#define K3 37

inline int16_t mul(int8_t a, int8_t b) {
    return (a * b);
}

inline int8_t fir_filter(int8_t x0, int8_t x1, int8_t x2, int8_t x3) {
    return (mul(K0, x0) + mul(K1, x1) + mul(K2, x2) + mul(K3, x3)) >> SCALE;
}

void __attribute__((noinline)) fir_filter_loop(int8_t *restrict x) {
    int status, done = 0;
    uint8_t data;
    _TCE_FIFO_U8_STREAM_IN(0, data, status);
    do {
        x[3] = x[2];
        x[2] = x[1];
        x[1] = x[0];
        x[0] = data - 128; 

        int8_t result = fir_filter(x[0], x[1], x[2], x[3]);
        _TCE_FIFO_U8_STREAM_OUT(result + 128);  


        done = (status == 0);
        _TCE_FIFO_U8_STREAM_IN(0, data, status);
        //printf("Line 1\n");
    } while (!done);
}

void sample_copy(int count) {
    int i, status = 0;
    uint8_t temp;
    for (i = 0; i < count; i++) {
        _TCE_FIFO_U8_STREAM_IN(0, temp, status);
        _TCE_FIFO_U8_STREAM_OUT(temp);
    }
}

int main(int argc, char *argv[]) {
    sample_copy(44);
    int8_t x[4] = {0, 0, 0, 0};
    fir_filter_loop(x);
    return 0;
}
