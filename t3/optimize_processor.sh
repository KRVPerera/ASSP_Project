#!/usr/bin/env bash

#set -exuo pipefail
set -uo pipefail

script_dir=$(dirname "$0")

clean_artifacts()
{
    echo "Cleaning all"
    rm -r "$script_dir/explore"
    rm -r "$script_dir/processor.adf"
    rm -r "$script_dir/procdb.dsdb"
}

print_usage()
{
    echo "Usage: $0 [-c]"
    echo "Options:"
    echo "    -c    Clean up temporary files"
    echo "    -h    Display this help"
}

print_warning()
{
    echo "WARNING: The '$1' exists. Continuing will delete its contents."
    echo "Do you want ot continue? (y/n)"
    read -r answer

    while [[ "$answer" != "y" && "$answer" != "n" ]]
    do
        echo "Invalud input. Please enter 'y' or 'n'."
        echo "WARNING: The '$1' exists. Continuing will delete its contents."
        echo "Do you want ot continue? (y/n)"
    done

    if [[ "$answer" == "n" ]]
    then
        echo "Aboring script"
        exit 1
    fi 

    echo "Cleaning file. $1"
    rm -r "$1"
}

while getopts ":ch" opt; do
    case $opt in
        c)
            clean_artifacts
            exit 0
            ;;
        h)
            print_usage
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            print_usage
            exit 1
            ;;
    esac
done

[[ -e processor.adf ]] && print_warning "processor.adf"
[[ -e procdb.dsdb ]] && print_warning "processor.adf"
[[ -e explore ]] && print_warning "explore"

cp ../t2_opt/processor.adf .
explore procdb.dsdb
explore -a processor.adf procdb.dsdb

mkdir explore
pushd explore

tcecc -O3 --unroll-threshold=10000 --inline-threshold=10000 -o program.bc --emit-llvm ../t2_opt/fir.c

touch correct_simulation_output
explore -d . ../procdb.dsdb

cp ../../t2_opt/input.in .

# step 8 - start the interconnect opt
CONF_ID=$(explore -v -e ConnectionSweeper -u cc_worsening_threshold=2 -s 1 ../procdb.dsdb)

popd

echo "CONF_ID : $CONF_ID"

first_integer=$(awk 'NR==2' <<< "$CONF_ID")
echo "First config : $first_integer"

explore -w $first_integer procdb.dsdb
