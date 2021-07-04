#!/bin/sh -l

cd /

output=$(python -m main)
output="${output//'%'/'%25'}"
output="${output//$'\n'/'%0A'}"
output="${output//$'\r'/'%0D'}"
echo "::set-output name=report::$output"
