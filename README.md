# Android device tree for Xiaomi Redmi A5 / POCO C71 (serenity)

```
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
```

## Specifications

| Feature | Specification |
| :--- | :--- |
| SoC | Unisoc T7250 (UMS9230) |
| Architecture | ARM64 (Cortex-A75 + Cortex-A55) |
| RAM | 4GB / 6GB LPDDR4X |
| Storage | 64GB / 128GB eMMC 5.1 |
| Display | 6.88" IPS LCD, 720x1640, 320dpi, 120Hz |
| GPU | Mali-G57 MC1 |
| Camera | 32MP (main) + 8MP (front) |
| Battery | 5200mAh |
| Connectivity | 4G LTE, Wi-Fi 5, Bluetooth 5.0, GPS |
| Fingerprint | Side-mounted (Goodix/Silead) |
| Target Product | `lineage_serenity` |
| ROM Base | LineageOS 22.0 (Android 15) |
| Vendor API Level | 33 (Android 13) |

## How to Build

```bash
source build/envsetup.sh
lunch lineage_serenity-ap3a-userdebug
m bacon
```
