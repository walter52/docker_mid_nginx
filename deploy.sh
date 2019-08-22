#!/usr/bin/env bash

#Author :walter52
#Mail :walter52@sohu.com
#Function :从阿里云拉取镜像脚本
#Version :v1.0
#在vim中用"set ff=unix"切换格式或者使用"dos2unix"命令

docker login --username=walter52@sohu.com registry.cn-shenzhen.aliyuncs.com
if [ $? -eq 1 ]; then
    echo "docker登录失败"
    exit 0
fi
docker pull registry.cn-shenzhen.aliyuncs.com/walter_self/mid_nginx:master
containerName='mid_nginx'
existContainer=(`docker ps -a | grep "${containerName}"`)
if [ -n "$existContainer" ]; then
    docker stop $existContainer
    docker container rm $existContainer
fi
docker run -d --name mid_nginx -d -p 80:80 registry.cn-shenzhen.aliyuncs.com/walter_self/mid_nginx:master
