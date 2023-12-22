#include <stdio.h>

#define K0 37
#define K1 109
#define K2 109
#define K3 37

int fir_filter(int x0, int x1, int x2, int x3)
{
    // Perform the FIR filtering
    return K0 * x0 + K1 * x1 + K2 * x2 + K3 * x3;
}

void __attribute__((noinline)) fir_filter_loop(int *restrict x)
{
    int data, status, done = 0;

    _TCE_FIFO_S16_STREAM_IN(0, data, status);
    do
    {
        // Shift input values in the buffer
        for (size_t i = 0; i < 4; i++)
        {
            x[3] = x[2];
            x[2] = x[1];
            x[1] = x[0];
            x[0] = data;
            int result = fir_filter(x[0], x[1], x[2], x[3]);
            _TCE_FIFO_S16_STREAM_OUT(result);
            done = (status == 0);
            _TCE_FIFO_S16_STREAM_IN(0, data, status);
        }

    } while (!done);
}

void sample_copy(int count)
{
    int i, temp, status;
    for (i = 0; i < count; i++)
    {
        _TCE_FIFO_S16_STREAM_IN(0, temp, status);
        _TCE_FIFO_S16_STREAM_OUT(temp);
    }
}

int main(int argc, char *argv[])
{
    // sample_copy(44);
    int x[4] = {0, 0, 0, 0};
    fir_filter_loop(x);
    return 0;
}