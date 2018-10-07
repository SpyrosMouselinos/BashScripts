#!/bin/bash
while /bin/true; do
	nvidia-smi -f ~/GPU/logs/gpudump.txt
	egrep -n "[0-3]%" ~/GPU/logs/gpudump.txt | awk -F "|" '{print ($1 - 9) / 3}' > ~/GPU/logs/gpulines.txt
	truncate -s 0 ~/GPU/logs/test.txt
	for x in `grep -o '[0-9]*' ~/GPU/logs/gpulines.txt`;
	do
 		echo -n $x',' >> ~/GPU/logs/test.txt
	done
	sed -i '$ s/.$//' ~/GPU/logs/test.txt
	sleep 10
done &
