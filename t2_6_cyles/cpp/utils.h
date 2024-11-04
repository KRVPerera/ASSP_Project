#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>
#include <memory>

#include <vector>

void appendIntValuesToFile(const std::string& filename, const std::vector<int>& values)
{
    std::ofstream file(filename, std::ios::app);
    if (!file.is_open())
    {
        std::cout << "Error opening file: " << filename << std::endl;
        return;
    }

    for (const int& value : values)
    {
        file << value << std::endl;
    }

    file.close();
}


std::vector<short> readFileLineByLine(const std::string& filename)
{
    std::vector<short> result;

    std::ifstream file(filename);
    if (!file.is_open())
    {
        std::cout << "Error opening file: " << filename << std::endl;
        return result;
    }

    std::string line;
    while (std::getline(file, line))
    {
        try
        {
            int number = std::stoi(line);
            result.push_back(static_cast<short>(number));
        }
        catch (const std::invalid_argument& e)
        {
            std::cerr << "Invalid number: " << line << std::endl;
        }
    }

    file.close();

    return result;
}


void readFileLineByLine(const std::string &filename, int numLinesToRead, std::streampos *lastSeekPoint, short data[8])
{
    std::ifstream file(filename);
    if (!file.is_open())
    {
        std::cout << "Error opening file: " << filename << std::endl;
        return;
    }

    // Set the seek point to the last saved position
    if (lastSeekPoint != nullptr)
    {
        file.seekg(*lastSeekPoint);
        std::cout << "Seeking to: " << *lastSeekPoint << std::endl;
        if (file.fail())
        {
            std::cerr << "Seeking failed, resetting to start of file" << std::endl;
            file.clear();                 // Clear the fail state
            file.seekg(0, std::ios::beg); // Reset to start of file
        }
        else
        {
            std::cout << "Seeking to: " << *lastSeekPoint << std::endl;
        }
    }

    std::string line;
    int linesRead = 0;
    while (linesRead < numLinesToRead && std::getline(file, line))
    {
        try
        {
            int number = std::stoi(line);
            data[linesRead] = static_cast<short>(number);
            std::cout << "Read number: " << number << std::endl;
        }
        catch (const std::invalid_argument &e)
        {
            std::cerr << "Invalid number: " << line << std::endl;
        }
        linesRead++;
        if (lastSeekPoint != nullptr)
        {
            *lastSeekPoint = file.tellg();
            std::cout << "Saving seek point: " << *lastSeekPoint << std::endl;
        }
    }

    file.close();
}

void _TCE_FIFO_U8_STREAM_OUT(unsigned char data)
{
    static FILE *outputFile = NULL;
    if (outputFile == NULL)
    {
        outputFile = fopen("OUR_OUT.out", "w");
        if (outputFile == NULL)
        {
            printf("Error opening output file\n");
            return;
        }
    }

    fprintf(outputFile, "%c\n", data);
}

#endif // UTILS_H
