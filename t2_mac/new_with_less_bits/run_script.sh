#!/usr/bin/env bash

tcl_script=$(cat scripts/"$1".tcl)
echo $tcl_script
ttasim -a proc_dilan.adf -p fir.tpef -e "$tcl_script"
