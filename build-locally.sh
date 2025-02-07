#!/bin/bash
#This script build the monolithic images locally, for cases like the raspberry pi, which operates on arm64 architecture, which isn't officially supported.

PURPLEBOLD="$(tput setf 5 bold)"

printf "${PURPLEBOLD}Building temporary modified Ubuntu image:\n"
docker build -t lancachenet/ubuntu:latest --progress tty https://github.com/lancachenet/ubuntu.git

printf  "${PURPLEBOLD}Building temporary Ubuntu-Nginx image:\n"
docker build -t lancachenet/ubuntu-nginx:latest --progress tty https://github.com/lancachenet/ubuntu-nginx.git

printf "${PURPLEBOLD}Building Monolithic image:\n"
docker build -t lancachenet/monolithic:latest --progress tty https://github.com/lancachenet/monolithic.git

printf "${PURPLEBOLD}Building Lancache-DNS image:\n"
docker build -t lancachenet/lancache-dns:latest --progress tty https://github.com/lancachenet/lancache-dns.git

printf "${PURPLEBOLD}Removing temporary Ubuntu image:\n"
docker rmi lancachenet/ubuntu

printf "${PURPLEBOLD}Removing temporary Ubuntu-Nginx image:\n"
docker rmi lancachenet/ubuntu-nginx
