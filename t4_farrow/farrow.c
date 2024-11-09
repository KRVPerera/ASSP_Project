#include <stdio.h>
#include <stdint.h>

#define SCALE 1024

void __attribute__((noinline)) filter_loop(int8_t *restrict x) {
    int status1, status2, done = 0;
    uint8_t signal1;
    uint8_t d_sig;
    do {
        _TCEFU_FIFO_U8_STREAM_IN("INPUT_2", 0, signal1, status1);
        _TCEFU_FIFO_U8_STREAM_IN("INPUT_1", 0, d_sig, status2);
        done = (status1 == 0);
        int16_t result;
        x[1] = x[0];
        x[0] = signal1;
        int16_t delay = ((int16_t)d_sig) << 10 >> 4;

        result = ((x[0] * (1024 - delay)) + (delay * x[1])) >> 10;

        _TCE_FIFO_U8_STREAM_OUT(result);
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
    int8_t x[2] = {0, 0};
    filter_loop(x);
    return 0;
}
