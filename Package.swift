// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftIconv",
    platforms: [
        .macOS(.v10_13),
        .tvOS(.v13),
        .iOS(.v13),
        .watchOS(.v6)
      ],
    products: [
        .library(
            name: "SwiftIconv",
            targets: ["SwiftIconv"])
    ],
    targets: [
        .systemLibrary(name: "iconv"),
        .target(
            name: "SwiftIconv",
            dependencies: [ "iconv" ],
            linkerSettings: [
                .linkedLibrary("iconv", .when( platforms: [ .macOS, .iOS, .tvOS, .watchOS ]))
            ]
        ),
        .testTarget(
            name: "SwiftIconvTests",
            dependencies: ["SwiftIconv"],
            resources: [
                .process("euc.txt"),
                .process("shiftjis.txt"),
                .process("shiftjis_large.txt"),
                .process("utf8.txt"),
            ]
        )
    ]
)
