#!/bin/bash
#删除冲突插件
rm -rf $(find ./feeds/luci/ -type d -regex ".*\(mosdns\|alist\|passwall\|argon\).*")
rm -rf $(find ./feeds/packages/ -type d -regex ".*\(alist\|mosdns\).*")
#更改默认地址为192.168.2.1
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

#根据源码来修改 openwrt-21.02
if [[ $REPO_URL == *"immortalwrt-mt798x"* ]] ; then
  #更新golang
  rm -rf feeds/packages/lang/golang
  git clone https://github.com/sbwml/packages_lang_golang -b 21.x feeds/packages/lang/golang
  #闪存频率_26MHZ修复
  if [[ $USE_52MHZ == "false" ]] ; then
     sed -i -e '/bus-width = <8>;/ a\    cap-mmc-highspeed;' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-rax3000m-emmc.dts         
  fi
  #修改默认WIFI名
  if [[ $MODIFY_WIFI == "true" ]] ; then
      WIFI_FILE="./package/mtk/applications/mtwifi-cfg/files/mtwifi.sh"
      sed -i "s/ssid=\"ImmortalWrt-2.4G\"/ssid=\"$USE_WIFI\"/" $WIFI_FILE
      sed -i "s/ssid=\"ImmortalWrt-5G\"/ssid=\"$USE_WIFI-5G\"/" $WIFI_FILE
  fi
  #配置文件修改_关闭内存优化_512M推荐关闭
  if [[ $USE_MEMORY_SHRINK == "false" ]] ; then
      AX3000_CONFIG="./defconfig/mt7981-ax3000.config"
      MTWIFI_CONFIG="./defconfig/mt7981-ax3000-mtwifi-cfg.config"
      sed -i '/CONFIG_MTK_MEMORY_SHRINK/d' $AX3000_CONFIG
      sed -i '/CONFIG_MTK_MEMORY_SHRINK/d' $MTWIFI_CONFIG
  fi
fi
