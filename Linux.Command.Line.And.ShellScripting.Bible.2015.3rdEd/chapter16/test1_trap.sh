#!/bin/bash
## !/usr/bin/ks  # this should be the 1st line of a korn shell script
## The original example of the book , named test1 , is trivial , so I wanted to play around and expand it! 
# Testing signal trapping
# trap "echo ' Sorry but I am not going to finish! I have trapped Ctrl-C'" SIGINT
# or equivalently substitute SIGINT with number 2  : 
# trap "echo ' Sorry but I am not going to finish! I have trapped Ctrl-C'" 2
# another multi-command example is : 
# trap " echo 'You pressed Ctrl-C! ' > ch16output_trap ; exit" SIGINT
# but to make the following work I must reverse the use of ' and " 
trap 'tempfile=$(mktemp ch16output1.XXXXXX); echo "You force me to finish with Ctrl-C,on loop #$count ">$tempfile ; exit' SIGINT
echo "This is a test script"
count=1
while [ $count -le 10 ]
do
  echo "Loop #$count"
  sleep 1
   count=$[ $count + 1 ]  ## arithmetics for bash 
  ## count=$(( $count + 1 ))   ## arithmetics for ksh, in case you develop a ksh
done
echo "This is the end of the test script"
