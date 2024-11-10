all: clean optimize

design:
	prode t2_opt.adf

design2:
	prode sim_9cycles_6.adf

optimize:
	./optimize_processor.sh

clean:
	./optimize_processor.sh -c

.PHONY: design optimize clean all
