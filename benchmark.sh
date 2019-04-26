#!/bin/bash
# @author: Kurucz Gabor
# @description: Fission Benchmark
# @created: 2019-03-05
# @version: 1.0

functionsGET=(hellojava hellogo hellopython)
functionsPOST=(primjava)
connections=(50)
times=(1m)
dt=`date '+%d/%m/%Y %H:%M:%S'`
fissionrouter="node1:32695"

echo -e "Benchmarking functions GET\n"
for functionGET in "${functionsGET[@]}"
do
    echo -e "Benchmarking $functionGET\n"
    hey -c $connections -z $times -m GET http://$fissionrouter/$functionGET > ./logs/$functionGET.hey.txt
done

echo -e "Benchmarking functions POST\n"
for functionPOST in "${functionsPOST[@]}"
do
    echo -e "Benchmarking $functionPOST\n"
    hey -c $connections -z $times -m POST -d '{"id":"44444"}' http://$fissionrouter/$functionPOST > ./logs/$functionPOST.hey.txt
done
