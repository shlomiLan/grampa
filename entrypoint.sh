#!/bin/sh -l

cd /

output=$(python -m main)
echo "::set-output name=report::$output"
