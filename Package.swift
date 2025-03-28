// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FixAnimationsTweak",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "FixAnimationsTweak",
            type: .dynamic,
            targets: ["FixAnimationsTweak"]),
    ],
    targets: [
        .target(
            name: "FixAnimationsTweak",
            swiftSettings: [
                .unsafeFlags(["-enable-experimental-feature", "SymbolLinkageMarkers"])
            ]
        ),
    ]
)
