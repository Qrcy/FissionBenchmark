#!/bin/bash
# @author: Kurucz Gabor
# @description: Fission Benchmark
# @created: 2019-03-05
# @version: 1.0

functionsGET=(khellojava khellogo khellopython)
functionsPOST=(kprimjava kprimgo kprimpython)
functionsGET2=(kmatrixjava kmatrixgo kmatrixpython)
connections=(100)
times=(5m)
now=$(date +"%m_%d_%Y_%H:%M:%S")
fissionrouter="192.168.0.10:30260"

echo -e "Benchmarking functions GET Hello"
for functionGET in "${functionsGET[@]}"
do
    echo -e "Benchmarking $functionGET"
    hey -c $connections -z $times -m GET http://$fissionrouter/$functionGET > ./logs/$functionGET.C.$connections.T.$times.$now.hey.txt
done

echo -e "Benchmarking functions POST Prim\n"
for functionPOST in "${functionsPOST[@]}"
do
    echo -e "Benchmarking $functionPOST"
    hey -c $connections -z $times -m POST -H "Content-Type: application/json" -d '{"id":"45"}' http://$fissionrouter/$functionPOST > ./logs/$functionPOST.C.$connections.T.$times.$now.hey.txt
done

echo -e "Benchmarking functions GET Matrix\n"
for functionGET2 in "${functionsGET2[@]}"
do
    echo -e "Benchmarking $functionGET2"
    hey -c $connections -z $times -m GET http://$fissionrouter/$functionGET2 > ./logs/$functionGET2.C.$connections.T.$times.$now.hey.txt
done