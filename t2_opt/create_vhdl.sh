#!/usr/bin/env bash

createbem processor.adf
generateprocessor -b processor.bem -e toplevel -l 'vhdl' -i processor.idf -o hdl_files processor.adf
