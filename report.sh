#!/bin/bash
# generate report from profile.pkl

if [[ $# -ne 2 ]] ; then
    echo 'ERROR: require 2 parameters'
    echo 'USAGE: run_report.sh UUID PASSPHRASE'
    exit 1
fi

# set up a unique ID for this run
RPT_UUID=$1

# create an output directory
OUTPUT_DIR="$PWD/output/$RPT_UUID"
echo "Create report in $OUTPUT_DIR"

# run the notebook to produce html report
jupyter nbconvert report.ipynb --no-input --to html --execute --output $OUTPUT_DIR/report.html --template ./static/report.tpl

# encrypt the report
./encrypt.py $OUTPUT_DIR/report.html $2

# remove the unencrypted
rm $OUTPUT_DIR/report.html

# copy in supporting static files
cp static/*.css $OUTPUT_DIR/
cp static/*.js $OUTPUT_DIR/

# send everything up to aws
echo "Sending to AWS"
aws2 s3 cp --recursive $OUTPUT_DIR s3://pdprofile-fiverr/reports/$RPT_UUID --acl public-read
echo "Report URL: https://pdprofile-fiverr.s3.eu-west-2.amazonaws.com/reports/$RPT_UUID/report-protected.html"