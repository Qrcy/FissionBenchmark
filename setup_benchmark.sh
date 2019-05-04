#!/bin/bash

mkdir logs

HEY_INSTALLED=$(which hey)
if [ "$HEY_INSTALLED" = "" ]
then
        apt-get update
        add-apt-repository ppa:longsleep/golang-backports -y
        apt-get update -y
        apt  install golang-go -y
        go get -u github.com/rakyll/hey
        cp $HOME/go/bin/hey /usr/local/bin
fi