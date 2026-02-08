#!/bin/bash

for vm in web01 web02 web03 web04
do
    cd ${vm}
    vagrant destroy -f
    cd ..
    rm -rf ${vm} 
done
