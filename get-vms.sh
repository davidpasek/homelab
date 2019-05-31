#!/bin/sh

docker run --rm -v /home/dpasek/scripts/homelab:/tmp/scripts --entrypoint='/usr/bin/pwsh' vmware/powerclicore /tmp/scripts/get-vms.ps1
