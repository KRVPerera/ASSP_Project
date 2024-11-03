#include <stdio.h>
#include "utils.h"
#include <vector>

int main() {
    short status = 1;
    int count = 0;
    std::streampos* lastSeekPoint = NULL;
    lastSeekPoint = new std::streampos;
    *lastSeekPoint = 0;
    short data[8];

    int global_line_count = 0;
    std::vector<short> datas = readFileLineByLine("input.in");

    printf("status\n");
    while (status > 0) {
        int clipped[8];
        short data[8];


        int j = 0;
        for (size_t i = global_line_count; i < 8; i++)
        {
            data[j] = datas[i];
            j++;
            global_line_count = i;
        }


        std::vector<int> data_out(8);
        for (int i = 0; i < 8; i++) {

            printf("data[%d] = %d\n", i, data[i]);

            data_out.push_back(data[i]);
        }

        appendIntValuesToFile("OUR_OUT.out", data_out);

        count += 1;
        if (count > 2) {
            status = 0;
        }
    }

    return 0;
}

