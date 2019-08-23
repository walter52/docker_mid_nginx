#!/usr/bin/env bash

#Author :walter52
#Mail :walter52@sohu.com
#Function :从阿里云拉取镜像脚本
#Version :v1.0
#在vim中用"set ff=unix"切换格式或者使用"dos2unix"命令

dockerName='mid_nginx'
dockerTag='master'
host='registry.cn-shenzhen.aliyuncs.com/walter_self'
dockerInfo=$host/$dockerName:$dockerTag

docker pull $dockerInfo
if [ $? -eq 1 ]; then
    echo "docker登录"
    docker login --username=walter52@sohu.com registry.cn-shenzhen.aliyuncs.com
    if [ $? -eq 1 ]; then
    echo "docker登录失败"
    exit 0
    fi
fi

existContainer=(`docker ps -a | grep "${dockerName}"`)
if [ -n "$existContainer" ]; then
    docker stop $dockerName
    docker container rm $dockerName
    docker image rm $dockerInfo
fi
docker run -d --name $dockerName -d -p 80:80 $dockerInfo
