#!/bin/bash

if [[ $# -ne 1 ]] ; then
    echo 'ERROR: require input filename'
    echo 'USAGE: run_report.sh INPUT_FILENAME'
    exit 1
fi


# set up a unique ID for this run
RPT_UUID=$(uuidgen)

# create an output directory
OUTPUT_DIR="$PWD/output/$RPT_UUID"
echo "Create output in $OUTPUT_DIR"
mkdir $OUTPUT_DIR

# write a config file for the notebook
echo $RPT_INPUT,$OUTPUT_DIR/profile.pkl > config

RPT_INPUT=$1
echo "Running profiler on $RPT_INPUT"

./profiler.py $RPT_INPUT $OUTPUT_DIR
