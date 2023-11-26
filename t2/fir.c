#include <stdio.h>

#define K0 37
#define K1 109
#define K2 109
#define K3 37

int fir_filter(int x0, int x1, int x2, int x3) {
    // Perform the FIR filtering
    return K0 * x0 + K1 * x1 + K2 * x2 + K3 * x3;
}

void __attribute__ ((noinline)) fir_filter_loop() {
    int data, status, done = 0;
    int x0 = 0, x1 = 0, x2 = 0, x3 = 0;

    _TCE_FIFO_S16_STREAM_IN(0, data, status);
    do {
        // Shift input values in the buffer
        x3 = x2;
        x2 = x1;
        x1 = x0;
        x0 = data;

        // Apply the FIR filter
        int result = fir_filter(x0, x1, x2, x3);

        // Output the result
        _TCE_FIFO_S16_STREAM_OUT(result);

        done = (status == 0);
        _TCE_FIFO_S16_STREAM_IN(0, data, status);
    } while (!done);
}

int main() {
    fir_filter_loop();
    return 0;
}