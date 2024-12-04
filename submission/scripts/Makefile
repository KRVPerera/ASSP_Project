dis: program.tpef processor.adf
	tcedisasm -s -n processor.adf prograam.tpef

design:
	prode processor.adf

program.tpef: source.c processor.adf
	tcecc -v -O3 -o program.tpef -a processor.adf source.c --unroll-threshold=10000

simu: program.tpef processor.adf
	proxim processor.adf program.tpef

simc: program.tpef processor.adf
	ttasim -a processor.adf -p program.tpef -e"run; puts[info proc cycles];quit"

asm: program.tpef program.adf
	tcedisasm -n -o program.tceasm processor.adf program.tpef

diff:
	diff output.out reference.out

vimdiff:
	vimdiff output.out reference.out

out34: output.out
	typeout output.out 34 2

outn: output.out
	typeout output.out

clean:
	rm -f *.tpef
	rm -f *.tceasm
	rm -f *.dot
	rm output.out
