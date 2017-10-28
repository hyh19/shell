#!/usr/bin/env bash
# 
# 描述：判断 Linux 发行版本（CentOS、Ubuntu、Debian）和软件包管理方式（yum、apt）
# 
# 参考：https://github.com/teddysun/shadowsocks_install/blob/master/haproxy.sh
#

check_sys() {
    local checkType=$1
    local value=$2

    local release=''
    local systemPackage=''

    if [ -f /etc/redhat-release ]; then
        release="centos"
        systemPackage="yum"
    elif cat /etc/issue | grep -Eqi "debian"; then
        release="debian"
        systemPackage="apt"
    elif cat /etc/issue | grep -Eqi "ubuntu"; then
        release="ubuntu"
        systemPackage="apt"
    elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
        release="centos"
        systemPackage="yum"
    elif cat /proc/version | grep -Eqi "debian"; then
        release="debian"
        systemPackage="apt"
    elif cat /proc/version | grep -Eqi "ubuntu"; then
        release="ubuntu"
        systemPackage="apt"
    elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
        release="centos"
        systemPackage="yum"
    fi

    if [ ${checkType} = "sysRelease" ]; then
        if [ "$value" = "$release" ]; then
            return 0
        else
            return 1
        fi
    elif [ ${checkType} = "packageManager" ]; then
        if [ "$value" = "$systemPackage" ]; then
            return 0
        else
            return 1
        fi
    fi
}
