#!/bin/bash

### 第二步，设置 ###

### 系统配置 ###
# 修改路由器IP
# sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

DEFAULT_SETTINGS_FILE="package/lean/default-settings/files/zzz-default-settings"
# 修改默认密码
# sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' $DEFAULT_SETTINGS_FILE
# 修改主机名
sed -i "/uci commit system/i\uci set system.@system[0].hostname='OpenWrt'" $DEFAULT_SETTINGS_FILE
# 修改默认主题
sed -i "/uci commit luci/i\uci set luci.main.mediaurlbase=/luci-static/bootstrap" $DEFAULT_SETTINGS_FILE
# 禁用DHCP服务（旁路由模式）
sed -i 's|exit|uci set dhcp.lan.ignore="1"\nuci set dhcp.lan.dynamicdhcp="0"\nuci commit dhcp|g' $DEFAULT_SETTINGS_FILE

# 修改一下固件版本，方便查看固件编译时间
current_build_date=`date +"%Y/%m/%d"`
sed -i "s|<%=pcdata(ver.distversion)%>|<%=pcdata(ver.distversion)%>(${current_build_date})|g" package/lean/autocore/files/arm/index.htm
sed -i "s|<%=pcdata(ver.distversion)%>|<%=pcdata(ver.distversion)%>(${current_build_date})|g" package/lean/autocore/files/x86/index.htm

### 插件配置 ###
# wrtbwmon默认刷新时间更改为 3 秒
sed -i 's/interval: 5/interval: 3/g' package/lean/luci-app-wrtbwmon/htdocs/luci-static/wrtbwmon/wrtbwmon.js
# 修改流量统计写入为10分钟
sed -i 's/option commit_interval 4h/option commit_interval 10m/g' feeds/packages/net/nlbwmon/files/nlbwmon.config
