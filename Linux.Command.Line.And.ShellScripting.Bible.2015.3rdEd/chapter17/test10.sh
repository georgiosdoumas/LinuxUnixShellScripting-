#!/bin/bash
# array variable to function test
function testit {
    local newarray
    # newarray=(`echo "$@"`) #this is one way to do it , or : 
    newarray=($(echo "$@"))
    echo "The new array value is: ${newarray[*]}"
}
myarray=(1 2 3 4 dog)
echo "The original array is ${myarray[*]}"
testit ${myarray[*]}
