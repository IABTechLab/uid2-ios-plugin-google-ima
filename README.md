# UID2 Google IMA iOS Plugin

A plugin for integrating [UID2](https://github.com/IABTechLab/uid2docs) and [Google IMA](https://developers.google.com/interactive-media-ads/docs/sdks/ios/client-side) into iOS applications.

[![License: Apache](https://img.shields.io/badge/License-Apache-green.svg)](https://www.apache.org/licenses/)
[![Swift](https://img.shields.io/badge/Swift-5-orange)](https://img.shields.io/badge/Swift-5-orange)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-blue)](https://img.shields.io/badge/Swift_Package_Manager-compatible-blue)

## Repository Structure

```
.
├── Development
│   ├── UID2GoogleIMADevelopmentApp
│   └── UID2GoogleIMADevelopmentApp.xcodeproj
├── Package.swift
├── LICENSE.md
├── README.md
├── Sources
│   └── UID2IMAPlugin
└── Tests
    └── UID2IMAPluginTests
```

## Requirements

* Xcode 14.0+

| Platform | Minimum target | Swift Version |
| --- | --- | --- |
| iOS | 13.0+ | 5.0+ |

## Development

The UID2IMAPlugin is a standalone headless library defined and managed by the Swift Package Manager via `Package.swift`.  As such the `UID2GoogleIMADevelopmentApp` is the primary way for developing the SDK.  Use Xcode to open `Development/UID2GoogleIMADevelopmentApp/UID2GoogleIMADevelopmentApp.xcodeproj` to begin development.

## License

UID2 is released under the Apache V2 license. [See LICENSE](https://github.com/IABTechLab/uid2-ios-sdk/blob/main/LICENSE.md) for details.

