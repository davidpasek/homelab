#!/bin/sh

docker run --rm justinclayton/racadm -r esx21-oob -u root -p calvin serveraction powerup
docker run --rm justinclayton/racadm -r esx22-oob -u root -p calvin serveraction powerup
docker run --rm justinclayton/racadm -r esx23-oob -u root -p calvin serveraction powerup
docker run --rm justinclayton/racadm -r esx24-oob -u root -p calvin serveraction powerup

