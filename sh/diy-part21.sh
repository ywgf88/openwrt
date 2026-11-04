#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part21.sh
# Description: OpenWrt DIY script part 2 (After Update feeds) —— X86/64 25.12
# 用途：启用 passwall2 / docker / diskman / run / argon
#

# 设置默认主题为 argon（可选，可在 LuCI 中切换 aurora）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# ===== 启用 passwall2 及常用内核组件 =====
cat >> .config <<'CFGEOF'
CONFIG_PACKAGE_luci-app-passwall2=y
CONFIG_PACKAGE_luci-i18n-passwall2-zh-cn=y
CONFIG_PACKAGE_xray-core=y
CONFIG_PACKAGE_sing-box=y
CONFIG_PACKAGE_v2ray-geoip=y
CONFIG_PACKAGE_v2ray-geosite=y
CFGEOF

# 2026-11-04 排查用：临时停用 clashoo / aurora / quickfile / partexp 四项，
# 用于二分定位编译失败来源（四个 feed 仍保留在 feeds.conf.default 中，不影响其他包）。

# ===== [已停用] 启用 clashoo（基于 mihomo）=====
# cat >> .config <<'CFGEOF'
# CONFIG_PACKAGE_luci-app-clashoo=y
# CONFIG_PACKAGE_luci-i18n-clashoo-zh-cn=y
# CFGEOF

# ===== 启用 argon 主题 =====
cat >> .config <<'CFGEOF'
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-app-argon-config=y
CONFIG_PACKAGE_luci-i18n-argon-config-zh-cn=y
CFGEOF

# ===== [已停用] 启用 aurora 主题 =====
# cat >> .config <<'CFGEOF'
# CONFIG_PACKAGE_luci-theme-aurora=y
# CFGEOF

# ===== 启用 luci-app-run =====
cat >> .config <<'CFGEOF'
CONFIG_PACKAGE_luci-app-run=y
CFGEOF

# ===== [已停用] 启用 luci-app-quickfile（依赖 luci-nginx + quickfile，自动选装）=====
# cat >> .config <<'CFGEOF'
# CONFIG_PACKAGE_luci-app-quickfile=y
# CFGEOF

# ===== [已停用] 启用 luci-app-partexp =====
# cat >> .config <<'CFGEOF'
# CONFIG_PACKAGE_luci-app-partexp=y
# CFGEOF

# ===== 启用 luci-app-diskman =====
cat >> .config <<'CFGEOF'
CONFIG_PACKAGE_luci-app-diskman=y
CFGEOF

# ===== 启用 Docker（docker + dockerd + luci-app-dockerman 管理界面）=====
cat >> .config <<'CFGEOF'
CONFIG_PACKAGE_docker=y
CONFIG_PACKAGE_dockerd=y
CONFIG_PACKAGE_luci-app-dockerman=y
CONFIG_PACKAGE_luci-i18n-dockerman-zh-cn=y
CONFIG_PACKAGE_docker-compose=y
CFGEOF

# ===== 启用 libffi（python3 _ctypes 编译依赖，缺 ffi.h 会导致编译失败）=====
cat >> .config <<'CFGEOF'
CONFIG_PACKAGE_libffi=y
CFGEOF
