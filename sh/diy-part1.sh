#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# 用途：为 X86/64 固件添加自定义 feed 源
#

# passwall2 源（Openwrt-Passwall 组织，2026-11 迁移）
echo "src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main" >> "feeds.conf.default"
echo "src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main" >> "feeds.conf.default"

# luci-theme-argon 主题
echo "src-git argon https://github.com/jerrykuku/luci-theme-argon.git;master" >> "feeds.conf.default"
echo "src-git argonconfig https://github.com/jerrykuku/luci-app-argon-config.git;master" >> "feeds.conf.default"

# luci-theme-aurora 主题
echo "src-git aurora https://github.com/eamonxg/luci-theme-aurora.git;master" >> "feeds.conf.default"

# luci-app-run（上传并运行 .run/.sh 等安装程序）
echo "src-git run https://github.com/wukongdaily/luci-app-run.git;master" >> "feeds.conf.default"

# luci-app-quickfile（网页文件管理器，基于 nginx）
echo "src-git quickfile https://github.com/sbwml/luci-app-quickfile.git;main" >> "feeds.conf.default"

# luci-app-partexp（一键分区扩容自动挂载）
echo "src-git partexp https://github.com/sirpdboy/luci-app-partexp.git;main" >> "feeds.conf.default"

# luci-app-clashoo（基于 mihomo 的代理）
echo "src-git clashoo https://github.com/kenzok8/openwrt-clashoo.git;main" >> "feeds.conf.default"

# luci-app-diskman（磁盘管理）
echo "src-git diskman https://github.com/lisaac/luci-app-diskman.git;master" >> "feeds.conf.default"
