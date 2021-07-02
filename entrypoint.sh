#!/bin/sh -l

cd /

output=$(python -m main)
echo "::set-output name=report::$output"

time=$(date)
echo "::set-output name=report::$time"
