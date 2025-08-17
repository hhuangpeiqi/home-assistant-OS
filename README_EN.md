# Home Assistant OS: Extended Device Support/CN Turbo

- [中文](README.md)
- [English](README_EN.md)

## 🏠 Project Overview
[![GitHub release](https://img.shields.io/github/release/hhuangpeiqi/home-assistant-OS.svg)](https://github.com/hhuangpeiqi/home-assistant-OS/releases)
[![License](https://img.shields.io/github/license/hhuangpeiqi/home-assistant-OS)](./LICENSE)


This is a customized version of the official [Home Assistant OS](https://github.com/home-assistant/operating-system), optimized for CN network and extended more hardware support:

- 🌐 **CN Network Optimization**: Uses CN mirrors(release) for faster downloads
- 🖥️ **More models supported**: Adds compatibility for unofficial devices
- 🔄 **Dual Version**: Provides both CN-optimized and official-original variants

## 📦 Version Comparison

| Feature            | CN-Optimized     | Official Original  |
|--------------------|--------------------|--------------------|
| Docker             | nju        | ghcr.io           |
| Update Server      | HAOS-CN Node        | Global Node       |
| Add-ons           | Popular CN Sources| Official Sources   |

## 📱 Supported Devices

#### (Continuous updates)Additional supported devices beyond official compatibility:

- **Orange Pi CM4**
  - ✅ Tested: v1.3.1 basic functions work
  - ⚠️ Known Issues: v1.4 fails to boot, TF card boot unstable
- **Panther X2**
  - ⚠️ Initial adaptation from other repo
  - ⚠️ Further testing required

> **Default Release Targets**: ova、generic-x86-64、generic-aarch64、rpi4-64、orangepi-cm4、panther-x2

## 🚀 Quick Start

### ✨ Latest Release

[![Latest Release](https://img.shields.io/github/release/hhuangpeiqi/home-assistant-OS?label=Latest)](https://github.com/hhuangpeiqi/home-assistant-OS/releases/latest)

### 📖 Installation Guide

1. **Download Image**  
   Get the latest build from [Releases](https://github.com/hhuangpeiqi/home-assistant-OS/releases) (CN-optimized by default)

2. **Flash to Device (Embedded ARM only)**  
   Recommended tools: 
   - [Balena Etcher](https://www.balena.io/etcher/)
   - [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
   - RKDevTool（Rockchip）
   - CLI
  ```bash
  # Example (modify as needed)
  dd if=haos_cn.img of=/dev/mmcblk1 bs=4M status=progress
  ```

> **Note**: CN-optimized version is recommended for better experience in mainland China

### ⚙️ Build

Prerequisites: Ensure build dependencies are installed

```bash
# CN-optimized build (e.g. orangepi-cm4)
./build --region cn make orangepi-cm4

# Original build
./build make orangepi-cm4
```

## Contributing
Issues and PRs are welcome, especially for new device adaptations.

## Acknowledgments

- [Official Home Assistant](https://github.com/home-assistant/operating-system) 
- [HAOS-CN](https://www.hasscn.top/): Provided CN mirror services
- All contributors for optimizations and device support

## License
Modified from Home Assistant OS under same [Apache License 2.0](./LICENSE).