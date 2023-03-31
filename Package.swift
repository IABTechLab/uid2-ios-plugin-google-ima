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
        .package(url: "https://github.com/IABTechLab/uid2-ios-sdk.git", from: "0.0.3")
    ],
    targets: [
        .target(
            name: "UID2IMAPlugin",
            dependencies: [
                .product(name: "UID2", package: "uid2-ios-sdk")
            ]),
        .testTarget(
            name: "UID2IMAPluginTests",
            dependencies: ["UID2IMAPlugin"],
            resources: [
                .copy("TestData")
            ])
    ]
)
