#!/bin/sh

docker run --rm -it -v /home/dpasek/scripts/homelab:/tmp/scripts vmware/powerclicore /tmp/scripts/get-vms.ps1
