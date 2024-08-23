#!/bin/bash

# Use absolute path to "t.sol" files in jobs.txt

LogFile=job.log  # Job log file
JobFile=jobs.txt  # Job file. One file per line

while read job; do

if forge test --match-path $job | grep -q "Suite result: FAILED"; then
  printf "\x1B[31mFailed $job\e[0m\n"
  echo "Time: $(date -Iseconds). Failed $job" >> $LogFile; else
  printf "\x1B[32mSuccess $job\e[0m\n"
  echo "Time: $(date -Iseconds). Success $job" >> $LogFile
fi

done < $JobFile
