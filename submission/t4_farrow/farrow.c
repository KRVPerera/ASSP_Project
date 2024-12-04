#include <stdio.h>
#include <stdint.h>

void __attribute__((noinline)) filter_loop(int *restrict x) {
    int status1, status2, done = 0;
    uint8_t signal1;
    uint8_t d_sig;

    do {
        _TCEFU_FIFO_U8_STREAM_IN("INPUT_1", 0, d_sig, status2);
        _TCEFU_FIFO_U8_STREAM_IN("INPUT_2", 0, signal1, status1);
        x[1] = x[0];
        x[0] = signal1;
        int8_t delay = d_sig;
        int8_t diff = 16 - d_sig;
        int mul1 = x[0] * diff;
        int mul2 = x[1] * delay;
        int result = (mul1 + mul2) >> 4;

        _TCE_FIFO_U8_STREAM_OUT(result);
        done = (status2 == 0);
    } while (!done);
}

void sample_copy(int count) {
    int i, status = 0;
    uint8_t temp;
    for (i = 0; i < count; i++) {
        _TCEFU_FIFO_U8_STREAM_IN("INPUT_1", 0, temp, status);
        _TCEFU_FIFO_U8_STREAM_IN("INPUT_2", 0, temp, status);
        _TCE_FIFO_U8_STREAM_OUT(temp);
    }
}

int main(int argc, char *argv[]) {
    sample_copy(44);
    int x[2] = {133, 0};
    filter_loop(x);
    return 0;
}
