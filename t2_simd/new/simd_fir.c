#include <stdio.h>

void __attribute__((noinline)) fir_filter_loop(int *restrict x) {
    int data, status, done = 0;

    _TCE_FIFO_S16_STREAM_IN(0, data, status);
    do {
        int result;
        x[3] = x[2];
        x[2] = x[1];
        x[1] = x[0];
        x[0] = data - 128; 

        _TCE_SIMD_MAC(x[0], x[1], x[2], x[3], result);

        _TCE_FIFO_S16_STREAM_OUT(result + 128);  

        done = (status == 0);
        _TCE_FIFO_S16_STREAM_IN(0, data, status);

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
