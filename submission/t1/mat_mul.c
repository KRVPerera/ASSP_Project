#include <stdio.h>
#include <stdbool.h>
#include <memory.h>
#include <stdlib.h>
#include <inttypes.h>

typedef uint16_t HALF;

HALF mulh(HALF i1, HALF i2);
HALF addh(HALF i1, HALF i2);
float HALFToFloat(HALF y);
HALF floatToHALF(float i);
HALF static floatToHalfI(uint32_t i);
uint32_t static halfToFloatI(HALF y);

#define SCALE 1024

float matmul_helper_half(float *A, float *B, int i, int j, int k, int columns_of_A, int columns_of_B)
{
    HALF sum_half = 0;
    for (int l = 0; l < k; l++)
    {
        HALF A_half = floatToHALF(A[i * columns_of_A + l]);
        HALF B_half = floatToHALF(B[l * columns_of_B + j]);
        HALF multi_half = mulh(A_half, B_half);
        sum_half = addh(sum_half, multi_half);
    }
    return HALFToFloat(sum_half);
}

float matmul_helper_fixed(float *A, float *B, int i, int j, int k, int columns_of_A, int columns_of_B)
{

    int fixed_point_sum = 0;
    for (int l = 0; l < k; l++)
    {
        float a_val = A[i * columns_of_A + l];
        int A_int = a_val * SCALE;
        printf("a_val: %f\n", a_val);
        printf("A_int: %d\n", A_int);

        float b_val = B[l * columns_of_B + j];
        int B_int = b_val * SCALE;
        printf("B_int: %d\n", B_int);

        int multi = A_int * B_int;
        printf("A_int * B_int: %d\n", multi);
        fixed_point_sum += multi / SCALE;

        printf("fixed_point_sum: %d\n", fixed_point_sum);
    }
    printf("fixed_point_sum ALL: %d\n", fixed_point_sum);
    printf("\n");
    return fixed_point_sum / SCALE;
}

// set Fix_Or_Float16 to true to get fixed point calculation. if it's false it will return floating point calculation
int Matrxi_Mul(float *A, float *B, float *Result, int rows_of_A, int columns_of_A, int rows_of_B, int columns_of_B, bool Fix_Or_Float16)
{
    if (columns_of_A != rows_of_B)
    {
        return 0;
    }

    // multiplication can be done
    // do multiplication
    for (int i = 0; i < rows_of_A; i++)
    {
        for (int j = 0; j < columns_of_B; j++)
        {
            float temp = 0;
            if (Fix_Or_Float16)
            {
                temp = matmul_helper_fixed(A, B, i, j, columns_of_A, columns_of_A, columns_of_B);
            }
            else
            {
                temp = matmul_helper_half(A, B, i, j, columns_of_A, columns_of_A, columns_of_B);
            }
            Result[i * columns_of_B + j] = temp;
        }
    }

    return 1;
}

void printMatrix(float *matrix, int rows, int columns)
{
    for (int i = 0; i < rows; i++)
    {
        for (int j = 0; j < columns; j++)
        {
            printf("%f ", matrix[i * columns + j]);
        }
        printf("\n");
    }
}

int main(int argc, char **argv)
{

    float A[2][3] = {{1, 2, 3}, {4, 5, 6}};
    float B[3][2] = {{1, 2}, {3, 4}, {5, 6}};
    float *Result;
    int rows_of_A = 2;
    int columns_of_A = 3;
    int rows_of_B = 3;
    int columns_of_B = 2;
    bool Fix_Or_Float16 = true;
    if (argc == 2)
    {
        Fix_Or_Float16 = false;
        printf("Using float16\n");
    }

    Result = (float *)malloc(rows_of_A * columns_of_B * sizeof(float));
    memset(Result, 0, rows_of_A * columns_of_B * sizeof(float));

    int result = Matrxi_Mul((float *)A, (float *)B, Result, rows_of_A, columns_of_A, rows_of_B, columns_of_B, Fix_Or_Float16);

    printf("Result is:\n");
    printMatrix(Result, rows_of_A, columns_of_B);

    if (result != 1)
    {
        printf("Multiplication can not be done!\n");
        return 0;
    }
    free(Result);
    return 0;
}

HALF mulh(HALF i1, HALF i2)
{
    HALF r;
    float i1f = HALFToFloat(i1);
    float i2f = HALFToFloat(i2);
    float rf = i1f * i2f;
    r = floatToHALF(rf);
    return r;
}

HALF addh(HALF i1, HALF i2)
{
    HALF r;
    float i1f = HALFToFloat(i1);
    float i2f = HALFToFloat(i2);
    float rf = i1f + i2f;
    r = floatToHALF(rf);
    return r;
}

float HALFToFloat(HALF y)
{
    union
    {
        float f;
        uint32_t i;
    } v;
    v.i = halfToFloatI(y);
    return v.f;
}

uint32_t static halfToFloatI(HALF y)
{
    int s = (y >> 15) & 0x00000001; // sign
    int e = (y >> 10) & 0x0000001f; // exponent
    int f = y & 0x000003ff;         // fraction

    // need to handle 7c00 INF and fc00 -INF?
    if (e == 0)
    {
        // need to handle +-0 case f==0 or f=0x8000?
        if (f == 0) // Plus or minus zero
            return s << 31;
        else
        { // Denormalized number -- renormalize it
            while (!(f & 0x00000400))
            {
                f <<= 1;
                e -= 1;
            }
            e += 1;
            f &= ~0x00000400;
        }
    }
    else if (e == 31)
    {
        if (f == 0) // Inf
            return (s << 31) | 0x7f800000;
        else // NaN
            return (s << 31) | 0x7f800000 | (f << 13);
    }

    e = e + (127 - 15);
    f = f << 13;

    return ((s << 31) | (e << 23) | f);
}

HALF floatToHALF(float i)
{
    union
    {
        float f;
        uint32_t i;
    } v;
    v.f = i;
    return floatToHalfI(v.i);
}

HALF static floatToHalfI(uint32_t i)
{
    register int s = (i >> 16) & 0x00008000;                // sign
    register int e = ((i >> 23) & 0x000000ff) - (127 - 15); // exponent
    register int f = i & 0x007fffff;                        // fraction

    // need to handle NaNs and Inf?
    if (e <= 0)
    {
        if (e < -10)
        {
            if (s) // handle -0.0
                return 0x8000;
            else
                return 0;
        }
        f = (f | 0x00800000) >> (1 - e);
        return s | (f >> 13);
    }
    else if (e == 0xff - (127 - 15))
    {
        if (f == 0) // Inf
            return s | 0x7c00;
        else
        { // NAN
            f >>= 13;
            return s | 0x7c00 | f | (f == 0);
        }
    }
    else
    {
        if (e > 30) // Overflow
            return s | 0x7c00;
        return s | (e << 10) | (f >> 13);
    }
}