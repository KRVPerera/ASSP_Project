all: cycles

dis: fir.tpef proc_dilan.adf
	tcedisasm -s -n proc_dilan.adf proc_dilan.tpef

design:
	prode proc_dilan.adf

fir.tpef: fir_mac.c proc_dilan.adf
	tcecc -v -O3 -o fir.tpef -a proc_dilan.adf fir_mac.c --unroll-threshold=10000 --inline-threshold=10000

simu: fir.tpef proc_dilan.adf
	proxim proc_dilan.adf fir.tpef

cycles: fir.tpef proc_dilan.adf
	ttasim -a proc_dilan.adf -p fir.tpef -e"run; puts [info proc cycles]; quit"

OUTPUT.out: fir.tpef proc_dilan.adf
	ttasim -a proc_dilan.adf -p fir.tpef -e"run; puts [info proc cycles]; quit"

stats: fir.tpef proc_dilan.adf
	./run_script.sh stats

asm: fir.tpef program.adf
	tcedisasm -n -o program.tceasm proc_dilan.adf fir.tpef

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
