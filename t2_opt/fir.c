#include <stdio.h>
#include <stdint.h>

const int8_t SCALE=8;
const int8_t K0=37;
const int8_t K1=109;
const int8_t K2=109;
const int8_t K3=37;

inline int16_t mul(int8_t a, int8_t b) {
    return (a * b);
}

inline int8_t fir_filter(int8_t x0, int8_t x1, int8_t x2, int8_t x3) {
    return (mul(K0, x0) + mul(K1, x1) + mul(K2, x2) + mul(K3, x3)) >> SCALE;
}

void __attribute__((noinline)) fir_filter_loop(int8_t *restrict x) {
    int status, done = 0;
    uint8_t data;
    uint8_t data2;
    do {
        _TCE_FIFO_U8_STREAM_IN(0, data, status);
        _TCE_FIFO_U8_STREAM_IN(0, data2, status);
        done = (status == 0);
        int8_t result;
        int8_t result2;
        for (int i = 0; i < 2; i++)
        {

            x[3] = x[2];
            x[2] = x[1];
            x[1] = x[0];
            x[0] = data - 128; 
            result = fir_filter(x[0], x[1], x[2], x[3]);


            x[3] = x[2];
            x[2] = x[1];
            x[1] = x[0];
            x[0] = data2 - 128; 
            result2 = fir_filter(x[0], x[1], x[2], x[3]);
        }
        _TCE_FIFO_U8_STREAM_OUT(result + 128);  
        _TCE_FIFO_U8_STREAM_OUT(result2 + 128);  
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
