#!/bin/bash

#Design Theme
#git clone --depth=1 --single-branch --branch $([[ $REPO_URL == *"lede"* ]] && echo "main" || echo "js") https://github.com/papagaye744/luci-theme-design.git
#git clone --depth=1 --single-branch https://github.com/gngpp/luci-app-design-config.git
#Argon Theme
git clone --depth=1 --single-branch --branch $([[ $REPO_URL == *"lede"* ]] && echo "18.06" || echo "master") https://github.com/jerrykuku/luci-theme-argon.git
git clone --depth=1 --single-branch --branch $([[ $REPO_URL == *"lede"* ]] && echo "18.06" || echo "master") https://github.com/jerrykuku/luci-app-argon-config.git

#Linkease
#git clone --depth=1 --single-branch https://github.com/linkease/istore.git
#git clone --depth=1 --single-branch https://github.com/linkease/nas-packages.git
#git clone --depth=1 --single-branch https://github.com/linkease/nas-packages-luci.git
#lucky
git clone --depth=1 --single-branch --branch "main" https://github.com/gdy666/luci-app-lucky.git
#alist
git clone --depth=1 --single-branch --branch "master" https://github.com/sbwml/luci-app-alist.git
#adguardhome
git clone --depth=1 --single-branch --branch "master" https://github.com/rufengsuixing/luci-app-adguardhome.git
#mosdns
git clone --depth=1 --single-branch --branch "v5" https://github.com/sbwml/luci-app-mosdns.git
#tailscale
#git clone --depth=1 --single-branch --branch "main" https://github.com/tailscale/tailscale.git
#luci-app-ssr-plus
#git clone --depth=1 --single-branch --branch "main" https://github.com/fw876/helloworld.git
#Pass Wall
git clone --depth=1 --single-branch https://github.com/xiaorouji/openwrt-passwall.git
git clone --depth=1 --single-branch https://github.com/xiaorouji/openwrt-passwall2.git
git clone --depth=1 --single-branch https://github.com/xiaorouji/openwrt-passwall-packages.git
#tinyfilemanager
git clone --depth=1 --single-branch --branch "master" https://github.com/muink/luci-app-tinyfilemanager.git

#Home Proxy
if [[ $REPO_URL == *"immortalwrt/immortalwrt"* ]] ; then
  git clone --depth=1 --single-branch --branch "dev" https://github.com/immortalwrt/homeproxy.git
fi
#修改Tiny Filemanager汉化
if [ -d *"tinyfilemanager"* ]; then
	sed -i '/msgid "Tiny File Manager"/{n; s/msgstr.*/msgstr "文件管理器"/}' ./luci-app-tinyfilemanager/po/zh_Hans/tinyfilemanager.po
	sed -i 's/启用用户验证/用户验证/g;s/家目录/初始目录/g;s/Favicon 路径/收藏夹图标路径/g' ./luci-app-tinyfilemanager/po/zh_Hans/tinyfilemanager.po
fi
