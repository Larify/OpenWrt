#!/bin/bash

### 第二步，设置 ###

### 系统配置 ###
DEFAULT_SETTINGS_FILE="package/default-settings/files/zzz-default-settings"
# 版本号增加构建日期（请保留Lienol相关的版本信息）
FW_BUILD_DATE=`date +"%Y/%m/%d"`
sed -i "s|OpenWrt SNAPSHOT|OpenWrt (${FW_BUILD_DATE})|g" $DEFAULT_SETTINGS_FILE
# 禁用DHCP服务（旁路由模式）
sed -i 's|exit|uci set dhcp.lan.ignore="1"\nuci set dhcp.lan.dynamicdhcp="0"\nuci commit dhcp|g' $DEFAULT_SETTINGS_FILE

# 修改NTP时间同步服务器
CONFIG_GENERATE_FILE="package/base-files/files/bin/config_generate"
sed -i "s|0.openwrt.pool.ntp.org|ntp.aliyun.com|g" $CONFIG_GENERATE_FILE
sed -i "s|1.openwrt.pool.ntp.org|time1.cloud.tencent.com|g" $CONFIG_GENERATE_FILE
sed -i "s|2.openwrt.pool.ntp.org|time.ustc.edu.cn|g" $CONFIG_GENERATE_FILE
sed -i "s|3.openwrt.pool.ntp.org|cn.pool.ntp.org|g" $CONFIG_GENERATE_FILE

### 删除一些不需要的包，可能造成问题 ###
rm -rf package/feeds/openwrt-luci/themes/luci-theme-bootstrap-mod

### 插件配置 ###
