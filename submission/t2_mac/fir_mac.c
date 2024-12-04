#include <stdio.h>

#define SCALE 8
#define K0 37
#define K1 109
#define K2 109
#define K3 37

void __attribute__((noinline)) fir_filter_loop(int *restrict x) {
    int data, data2, status, done = 0;

    do {
        _TCE_FIFO_S16_STREAM_IN(0, data, status);
        _TCE_FIFO_S16_STREAM_IN(0, data2, status);
        done = (status == 0);
        int result;
        int result2;
        int res1;
        int res2;
        int res3;
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

        _TCE_FIFO_S16_STREAM_OUT(result + 128);  
        _TCE_FIFO_S16_STREAM_OUT(result2 + 128);  
    } while (!done);
}

void sample_copy(int count) {
    int i, temp, status;
    for (i = 0; i < count; i++) {
        _TCE_FIFO_S16_STREAM_IN(0, temp, status);
        _TCE_FIFO_S16_STREAM_OUT(temp);
    }
}

int main(int argc, char *argv[]) {
    sample_copy(44);
    int x[4] = {0, 0, 0, 0};
    fir_filter_loop(x);
    return 0;
}
