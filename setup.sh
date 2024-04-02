#!/bin/bash

# 检查是否以 root 身份运行
if [ "$(id -u)" != "0" ]; then
    echo "此脚本需要以 root 身份运行，请使用 'sudo' 运行此脚本。"
    echo "脚本将在5秒后退出"
    sleep 5
    exit 1
fi

# 判断用户的操作系统
if [ -f /etc/debian_version ]; then
    OS="Debian"
elif [ -f /etc/alpine-release ]; then
    OS="Alpine"
else
    echo "未知的操作系统。请提Issues!"
    exit 1
fi

# 输出选项列表
echo "本脚本将会再您当前打开的目录存放脚本文件"
echo "如果您不想在此存放脚本,请先cd到相关目录再运行."
echo "请选择一个选项："
echo "1. 完整安装"
echo "2. 我已经安装了Python和Pip"
echo "3. 我只需要运行脚本"

# 读取用户输入
read -p "请输入选项编号: " option

# 根据用户选择执行不同的操作
case $option in
    1)
        # 完整安装操作
        echo "你选择了完整安装"
        if [ "$OS" == "Debian" ] || [ "$OS" == "Ubuntu" ]; then
            # Debian/Ubuntu 安装命令
            echo "检测到您的操作系统为Debian/Ubuntu,请核对是否正确"
            echo "如果错误请按下Ctrl+C立即终止,脚本将在5秒后正式开始安装."
            sleep 5
            apt update
            apt install curl git
            apt-get install python3 -y
            apt-get install python3-pip -y
            pip3 install python-dateutil django==4.2.11 requests beautifulsoup4 -i https://pypi.tuna.tsinghua.edu.cn/simple
            echo "运行脚本..."
            sleep 1
            python3 main.py
            echo "脚本部署完毕!请手动运行 'python3 manage.py runserver 0.0.0.0:端口' !"
            exit 1
        elif [ "$OS" == "Alpine" ]; then
            # Alpine 安装命令
            echo "检测到您的操作系统为Alpine,请核对是否正确"
            echo "(您的操作系统安装脚本目前正在测试中,遇到BUG请提Issues!)"
            echo "如果错误请按下Ctrl+C立即终止,脚本将在5秒后正式开始安装."
            sleep 5
            sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
            apk add --update --no-cache curl jq py3-configobj py3-pip py3-setuptools python3 python3-dev git
            pip3 install python-dateutil django==4.2.11 requests beautifulsoup4 -i https://pypi.tuna.tsinghua.edu.cn/simple
            echo "运行脚本..."
            sleep 1
            python3 main.py
            echo "脚本部署完毕!请手动运行 'python3 manage.py runserver 0.0.0.0:端口' !"
            exit 1
        fi
        ;;
    2)
        echo "你选择了已经安装了Python和Pip"
        pip3 install python-dateutil django==4.2.11 requests beautifulsoup4 -i https://pypi.tuna.tsinghua.edu.cn/simple
        echo "运行脚本..."
        sleep 1
        python3 main.py
        echo "脚本部署完毕!请手动运行 'python3 manage.py runserver 0.0.0.0:端口' !"
        exit 1
        ;;
    3)
        echo "你选择了只需要运行脚本"
        echo "运行脚本..."
        sleep 1
        python3 main.py
        echo "脚本部署完毕!请手动运行 'python3 manage.py runserver 0.0.0.0:端口' !"
        exit 1
        ;;
    *)
        echo "无效的选项。"
        ;;
esac
