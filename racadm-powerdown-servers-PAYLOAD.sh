#!/bin/sh

docker run --rm justinclayton/racadm -r esx21-oob -u root -p calvin serveraction powerdown
docker run --rm justinclayton/racadm -r esx22-oob -u root -p calvin serveraction powerdown

