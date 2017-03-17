#!/bin/bash
# Testing signal trapping
# trap "echo ' Sorry but I am not going to finish! I have trapped Ctrl-C'" SIGINT
# or equivalently : 
# trap "echo ' Sorry but I am not going to finish! I have trapped Ctrl-C'" 2
# another multi-command example is : 
# trap " echo 'You pressed Ctrl-C! ' > ch16output_trap ; exit" SIGINT
# but to make the following work I must reverse the use of ' and " 
 trap 'tempfile=$(mktemp ch16output1.XXXXXX) ; echo "You force me to finish with Ctrl-C,on loop #$count ">$tempfile ; exit' SIGINT
echo "This is a test script"
count=1
while [ $count -le 10 ]
do
  echo "Loop #$count"
  sleep 1
   count=$[ $count + 1 ]  ## arithmetics for bash 
  ## count=$(( $count + 1 ))   # arithmetics for ksh
done
echo "This is the end of the test script"
