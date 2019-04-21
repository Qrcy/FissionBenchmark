#!/bin/bash

WRK_INSTALLED=$(which wrk)
if [ "$WRK_INSTALLED" = "" ]
then
        apt update
        apt install build-essential libssl-dev git -y
        git clone https://github.com/wg/wrk.git wrk
        cd wrk
        make
        cp wrk /usr/local/bin
fi

HEY_INSTALLED=$(which hey)
if [ "$HEY_INSTALLED" = "" ]
then
        apt update
        add-apt-repository ppa:longsleep/golang-backports
        sudo apt-get update
        sudo apt-get install golang-go-1.12 
        go get -u github.com/rakyll/hey
fi