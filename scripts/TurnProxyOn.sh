#!/bin/bash

# TurnProxyOn.sh
# Sidestep
#
# Created by Chetan Surpur on 10/26/10.
# Copyright 2010 Chetan Surpur. All rights reserved.

if [ ! $1 ] || [ ! $2 ]; then
	echo "Usage: TurnProxyOn deviceName localPort"
    exit 0
fi

DEVICENAME=$1
LOCALPORT=$2

/usr/libexec/authopen networksetup -setsocksfirewallproxy $DEVICENAME 127.0.0.1 $LOCALPORT
/usr/libexec/authopen networksetup -setproxybypassdomains $DEVICENAME *.local localhost 127.0.0.1 169.254/16 192.168/16 172.16.0.0/12 10.0.0.0/8
/usr/libexec/authopen networksetup -setsocksfirewallproxystate $DEVICENAME on