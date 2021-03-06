#!/bin/bash
#
# Copyright (c) 2019-2020 Xavier <https://zxavier.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/zhangXavier/openwrt-Actions/
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# fw876/helloworld
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# 新luci-theme-argon主题
rm -rf package/lean/luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config

# Clone community packages to package/community
mkdir package/community

# Add luci-app-openclash 只添加仓库的 luci-app-openclash 文件夹
wget https://github.com/vernesong/OpenClash/archive/master.zip -P downloads
unzip -o downloads/master.zip -d downloads
mv downloads/OpenClash-master/luci-app-openclash package/community/
rm -rf downloads

# 添加smartdns
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns.git feeds/packages/net/smartdns
git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns.git package/community/luci-app-smartdns

#添加adguardhome
git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome.git package/community/luci-app-adguardhome

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan.git package/community/luci-app-serverchan

# Add luci-app-onliner (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner.git package/community/luci-app-onliner

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter.git package/openwrt-subconverter
