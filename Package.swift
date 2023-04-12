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
        .package(url: "https://github.com/IABTechLab/uid2-ios-sdk.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "UID2IMAPlugin",
            dependencies: [
                .product(name: "UID2", package: "uid2-ios-sdk"),
                "GoogleInteractiveMediaAds"
            ]),
        .binaryTarget(name: "GoogleInteractiveMediaAds",
                      url: "https://imasdk.googleapis.com/native/downloads/ima-ios-v3.18.5.zip",
                      checksum: "f8473b337f4a24d0cf92e3e25227a9d33de139597b18332c368629ed30871422"),
        .testTarget(
            name: "UID2IMAPluginTests",
            dependencies: ["UID2IMAPlugin"],
            resources: [
                .copy("TestData")
            ])
    ]
)
