#!/usr/bin/env bash

#Author :walter52
#Mail :walter52@sohu.com
#Function :从阿里云拉取镜像脚本
#Version :v1.0
#在vim中用"set ff=unix"切换格式或者使用"dos2unix"命令

docker login --username=walter52@sohu.com registry.cn-shenzhen.aliyuncs.com
docker pull registry.cn-shenzhen.aliyuncs.com/walter_self/mid_nginx:master
docker run -d --name min