// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "BuilderiOS",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "BuilderiOS",
            targets: [
                "BuilderCommon",
                "BuilderProviders"
            ]),
    ],
    dependencies: [],
    targets: [

        .target(
            name: "BuilderCommon",
            dependencies: [],
            path: "Sources/Common"),

        .target(
            name: "BuilderProviders",
            dependencies: [
                "BuilderCommon"
            ],
            path: "Sources/Providers"),

        .testTarget(
            name: "BuilderCommonTests",
            dependencies: [
                "BuilderCommon"
            ],
            path: "Tests/CommonTests")
    ]
)
