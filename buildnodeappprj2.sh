#!/bin/bash

cd /home/sneha_chaudhary/LBG_API/LBG-API

#check if image exists, then remove image to recreate
#if [ docker ps -a | grep nodeappcon > /dev/null ]; then
#	OLD_IMAGE=$(docker ps -a | grep CONTAINER | awk '{print $2}')
#fi

docker build -t nodeappprj2:latest .



