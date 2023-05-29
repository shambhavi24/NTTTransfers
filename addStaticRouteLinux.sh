#!/bin/bash
destination_ip_address=$1
netmask=$2
gateway_address=$3
operation=$4

echo $operation
route add -net $destination_ip_address netmask $netmask gw $gateway_address
if [ $? != 0 ] && [ ${operation} == "Add" ]
then
        echo "Error occurred because route already exists"
        exit 1
fi