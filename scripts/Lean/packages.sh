#!/bin/bash

### 第一步，添加所需的包 ###

# Add packages
# passwall 有安装包依赖，请勿删除 feeds.conf.default 下的 https://github.com/kenzok8/small
svn co https://github.com/kenzok8/openwrt-packages/trunk/tcping package/kenzok8/tcping
svn co https://github.com/kenzok8/openwrt-packages/trunk/naiveproxy package/kenzok8/naiveproxy
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-openclash package/kenzok8/luci-app-openclash

# use vernesong github repo
rm -rf package/kenzok8/luci-app-openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/vernesong/luci-app-openclash

svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall package/kenzok8/luci-app-passwall

# HelloWorld
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-vssr package/kenzok8/luci-app-vssr

# ShadowSocksR Plus+
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-ssr-plus package/kenzok8/luci-app-ssr-plus
