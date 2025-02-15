#include <stdio.h>
#include <stdint.h>

#define SCALE 8
#define K0 37
#define K1 109
#define K2 109
#define K3 37

void __attribute__((noinline)) fir_filter_loop(int16_t *restrict x) {
    int status, done = 0;
    uint8_t data, data2;

    do {
        _TCE_FIFO_U8_STREAM_IN(0, data, status);
        _TCE_FIFO_U8_STREAM_IN(0, data2, status);
        done = (status == 0);
        int16_t result;
        int16_t result2;
        int16_t res1;
        int16_t res2;
        int16_t res3;
        x[3] = x[2];
        x[2] = x[1];
        x[1] = x[0];
        x[0] = data - 128; 
        _TCE_DILANMAC(K0, x[0], 0, res1);
        _TCE_DILANMAC(K1, x[1], res1, res2);
        _TCE_DILANMAC(K2, x[2], res2, res3);
        _TCE_DILANMAC(K3, x[3], res3, result);
        result = result >> SCALE;

        x[3] = x[2];
        x[2] = x[1];
        x[1] = x[0];
        x[0] = data2 - 128; 
        _TCE_DILANMAC(K0, x[0], 0, res1);
        _TCE_DILANMAC(K1, x[1], res1, res2);
        _TCE_DILANMAC(K2, x[2], res2, res3);
        _TCE_DILANMAC(K3, x[3], res3, result2);
        result2 = result2 >> SCALE;

        _TCE_FIFO_U8_STREAM_OUT(result + 128);  
        _TCE_FIFO_U8_STREAM_OUT(result2 + 128);  
    } while (!done);
}

void sample_copy(int count) {
    int i, status;
    uint8_t temp;
    for (i = 0; i < count; i++) {
        _TCE_FIFO_U8_STREAM_IN(0, temp, status);
        _TCE_FIFO_U8_STREAM_OUT(temp);
    }
}

int main(int argc, char *argv[]) {
    sample_copy(44);
    int16_t x[4] = {0, 0, 0, 0};
    fir_filter_loop(x);
    return 0;
}
