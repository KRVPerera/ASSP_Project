all: filter

filter:
	g++ -std=c++11 filter.cpp -o filter

run: filter
	./filter

clean:
	rm -f OUTPUT_1.out
	rm -f OUR_OUT.out
	rm -f filter

.PHONY: clean run
