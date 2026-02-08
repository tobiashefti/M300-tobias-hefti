#!/bin/bash

for vm in web01 web02 web03 web04
do
    cd ${vm}
    echo "VM: ${vm}"
    vagrant port
    cd ..
done
