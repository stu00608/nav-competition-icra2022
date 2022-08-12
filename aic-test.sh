#!/bin/bash

while getopts o: flag
do
    case "${flag}" in
        o) output_file_name=${OPTARG};;
    esac
done

SECONDS=0

for i in {0..10} ; do
    n=`expr $i \* 6` # 10 test BARN worlds with equal spacing indices: [0, 6, 12, ..., 294]
    python3 run.py --out $output_file_name --world_idx $n
    sleep 10
    killall roslaunch
    sleep 10
done

duration=$SECONDS
echo "Time : $(($duration / 60)) m $(($duration % 60)) s."