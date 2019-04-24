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
        add-apt-repository ppa:longsleep/golang-backports -y
        apt-get update -y
        ##apt  install golang-go -y
        wget https://dl.google.com/go/go1.12.4.linux-amd64.tar.gz
        tar -C /usr/local -xzf go1.12.4.linux-amd64.tar.gz
        go get -u github.com/rakyll/hey
fi