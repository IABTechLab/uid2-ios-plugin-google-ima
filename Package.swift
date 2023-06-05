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
        .package(url: "https://github.com/IABTechLab/uid2-ios-sdk.git", from: "0.2.0")
        // Google IMA SDK will become a dependency here once Google adds SPM support (Expected Q2 2023)
    ],
    targets: [
        .target(
            name: "UID2IMAPlugin",
            dependencies: [
                .product(name: "UID2", package: "uid2-ios-sdk"),
                "GoogleInteractiveMediaAds"
            ]),
        // Binary Target will removed once Google IMA supports SPM (Expected Q2 2023)
        // IMA 3.18.5 is first public beta of IMA with Secure Signals
        .binaryTarget(name: "GoogleInteractiveMediaAds",
                      url: "https://imasdk.googleapis.com/native/downloads/ima-ios-v3.19.1.zip",
                      checksum: "d34b186079068cd2d7aa85198429b38939b37e21186800ad27e2fb240abd2494"),
        .testTarget(
            name: "UID2IMAPluginTests",
            dependencies: ["UID2IMAPlugin"],
            resources: [
                .copy("TestData")
            ])
    ]
)
