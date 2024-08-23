#!/bin/bash

# Use absolute path to "t.sol" files in jobs.txt

while read job; do

if forge test --match-path $job | grep -q "Suite result: FAILED"; then
  printf "\x1B[31mFailed\e[0m\n"
  echo "$job Failed" >> job.log; else
  printf "\x1B[32mSuccess\e[0m\n"
  echo "$job Success" >> job.log
fi

done < jobs.txt
