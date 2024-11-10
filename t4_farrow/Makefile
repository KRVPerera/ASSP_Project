all: cycles

dis: farrow.tpef processor.adf
	tcedisasm -s -n processor.adf farrow.tpef

design:
	prode processor.adf

farrow.tpef: farrow.c processor.adf
	tcecc -v -Wall -O3 -o farrow.tpef -a processor.adf farrow.c --unroll-threshold=10000 --inline-threshold=10000

simu: farrow.tpef processor.adf
	proxim processor.adf farrow.tpef

cycles: farrow.tpef processor.adf
	ttasim -a processor.adf -p farrow.tpef -e"run; puts [info proc cycles]; quit"

OUTPUT.out: farrow.tpef processor.adf
	ttasim -a processor.adf -p farrow.tpef -e"run; puts [info proc cycles]; quit"

stats: farrow.tpef processor.adf
	./run_script.sh stats

asm: farrow.tpef program.adf
	tcedisasm -n -o program.tceasm processor.adf farrow.tpef

diff: OUTPUT.out
	diff -w OUTPUT.out reference.out

out34: OUTPUT.out
	typeout output.out 34 2

outn: OUTPUT.out
	typeout output.out

clean:
	rm -f *.tpef
	rm -f *.tceasm
	rm -f *.dot
	rm -f *.tpef.*
	rm -f output.out

.PHONY: clean dis cycles stats diff outn out34 run stats
