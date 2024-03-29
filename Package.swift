// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UID2IMAPlugin",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "UID2IMAPlugin",
            targets: ["UID2IMAPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/IABTechLab/uid2-ios-sdk.git", from: "0.2.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git", from: "3.18.5")
    ],
    targets: [
        .target(
            name: "UID2IMAPlugin",
            dependencies: [
                .product(name: "UID2", package: "uid2-ios-sdk"),
                .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios")
            ]),
        .testTarget(
            name: "UID2IMAPluginTests",
            dependencies: ["UID2IMAPlugin"],
            resources: [
                .copy("TestData")
            ])
    ]
)
