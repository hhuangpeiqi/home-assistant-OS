# Home Assistant OS 适配机型+国内加速

- [中文](README.md)
- [English](README_EN.md)

## 🏠 项目简介
[![GitHub release](https://img.shields.io/github/release/hhuangpeiqi/home-assistant-OS.svg)](https://github.com/hhuangpeiqi/home-assistant-OS/releases)
[![License](https://img.shields.io/github/license/hhuangpeiqi/home-assistant-OS)](./LICENSE)


本项目是基于官方 [Home Assistant OS](https://github.com/home-assistant/operating-system) 的定制版本，主要针对国内使用环境进行了优化，并添加了对更多机型的支持：

- 🌐 **国内网络优化**：默认（release）使用国内镜像源加速下载
- 🖥️ **更多机型支持**：新增多种非官方支持设备的适配
- 🔄 **双版本支持**：同时提供国内加速版和官方原版

## 📦 版本区别

| 特性               | 国内加速版          | 官方原版          |
|--------------------|-------------------|-----------------|
| docker             | 国内镜像（nju）  | 官方源（ghcr.io）    |
| 更新服务器         | 国内节点           | 国际节点         |
| Add-ons          | 国内常用插件源       | 官方默认        |

## 📱 已适配设备

#### （持续更新）除了官方支持的设备外，本版本还额外支持以下设备：

- **Orange Pi CM4**
  - ✅ 测试v1.3.1硬件基本功能正常
  - ⚠️ 已知问题： v1.4硬件无法启动、TF卡启动可能异常
- **Panther X2**
  - ⚠️ 初步适配来源于网络（抱歉，忘记来源仓库）
  - ⚠️ 详细待测试

> **默认Release机型**：ova、generic-x86-64、generic-aarch64、rpi4-64、orangepi-cm4、panther-x2

## 🚀 快速开始

### ✨ 最新版本

[![Latest Release](https://img.shields.io/github/release/hhuangpeiqi/home-assistant-OS?label=最新版本)](https://github.com/hhuangpeiqi/home-assistant-OS/releases/latest)

### 📖 安装指南

1. **下载镜像**  
   从 [Releases 页面](https://github.com/hhuangpeiqi/home-assistant-OS/releases) 下载最新镜像（默认提供国内加速版）

2. **写入设备（仅针对嵌入式，其余设备按照实际情况使用）**  
   嵌入式arm设备（img）推荐使用以下工具刷写镜像：
   - [Balena Etcher](https://www.balena.io/etcher/)
   - [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
   - RKDevTool（Rockchip）
   - 命令行写入
  ```bash
  # 命令行写入示例（根据实际情况修改）
  dd if=haos_cn.img of=/dev/mmcblk1 bs=4M status=progress
  ```

> **注意**：国内用户建议使用国内加速版以获得更好的体验

### ⚙️ 构建说明

如需自行构建，请确保已安装必要的依赖环境：

```bash
# 国内加速版构建（orangepi-cm4为例）
./build --region cn make orangepi-cm4

# 原版构建
./build make orangepi-cm4
```

## 贡献
欢迎通过 Issue 或 Pull Request 提交改进建议。特别欢迎针对新设备适配的贡献。

## 致谢

- [Home Assistant 官方项目](https://github.com/home-assistant/operating-system) 
- [HAOS-CN 老王杂谈说](https://www.hasscn.top/)：提供国内所需源服务
- 所有为国内加速和机型适配提供支持的开发者

## 许可证
本项目基于 Home Assistant OS 官方项目修改，遵循相同的 [Apache License 2.0](./LICENSE) 许可。