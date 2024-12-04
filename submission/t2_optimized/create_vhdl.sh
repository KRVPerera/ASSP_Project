#!/usr/bin/env bash

createbem processor.adf
generateprocessor -b processor.bem -e toplevel -l 'vhdl' -i processor.idf -o hdl_files processor.adf
generatebits -e toplevel -b processor.bem -d -w 4 -p fir.tpef -x hdl_files -f 'mif' -o 'mif' processor.adf

