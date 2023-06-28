// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Builder",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Builder",
            targets: ["Builder"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.4.1"),
    ],
    targets: [
        .target(
            name: "Builder",
            dependencies: [
                "Resolver",
            ],
            path: "Sources"),
    ]
)
