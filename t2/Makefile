all: simc

dis: fir.tpef processor.adf
	tcedisasm -s -n processor.adf fir.tpef

design:
	prode processor.adf

fir.tpef: fir.c processor.adf
	tcecc -v -O3 -o fir.tpef -a processor.adf fir.c --unroll-threshold=10000 --inline-threshold=10000

simu: fir.tpef processor.adf
	proxim processor.adf fir.tpef

simc: fir.tpef processor.adf
	ttasim -a processor.adf -p fir.tpef -e"run; puts [info proc cycles]; quit"

asm: fir.tpef program.adf
	tcedisasm -n -o program.tceasm processor.adf fir.tpef

diff:
	diff output.out reference.out

diffv:
	vimdiff output.out reference.out

filter:
	g++ -std=c++11 filter.cpp -o filter

out34: output.out
	typeout output.out 34 2

outn: output.out
	typeout output.out

clean:
	rm -f *.tpef
	rm -f *.tceasm
	rm -f *.dot
	rm -f *.tpef.*
	rm -f output.out
	rm -f filter

.PHONY: clean dis simc simu diff vimdiff outn out34
