#!/bin/bash

# 安装依赖
apt-get update -y
apt-get install build-essential libevent-dev zlib1g-dev libssl-dev -y

# 下载Redis源码
wget https://download.redis.io/releases/redis-6.2.6.tar.gz

# 解压源码
tar -xzf redis-6.2.6.tar.gz

# 进入源码目录
cd redis-6.2.6

# 编译源码
make

# 安装Redis
make install

# 配置Redis服务
cp /usr/local/etc/redis.conf /etc/redis/redis.conf
systemctl enable redis-server
systemctl start redis-server

# 检查Redis是否安装成功
redis-cli ping