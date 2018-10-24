#!/bin/bash
command=$1
log="prog.log"
match=$2

$command > "$log" 2>&1 &
pid=$!

while true;
do
    if fgrep --quiet "$match" "$log"
    then
        kill $pid
        exit 0
    fi
done
