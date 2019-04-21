#!/bin/bash
# @author: Kurucz Gabor
# @description: Fission Benchmark
# @created: 2019-03-05
# @version: 1.0

functions=(hellojava hellogo hellopython primjava)
connections=(50)
times=(5m)
fissionrouter="node1:32631"

echo -e "Benchmarking functions\n"
for function in "${functions[@]}"
do
    echo -e "Benchmarking $function\n"
    echo -e "hey-summary\n"
    hey -c $connections -z $times -m POST -d '{"id":"44444"}' http://$fissionrouter/$function > ./$function.$connection.$times.$datetime.hey.txt
done
