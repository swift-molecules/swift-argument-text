// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-argument-text",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Argument Text",
            targets: ["Argument Text"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-argument.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-text.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Argument Text",
            dependencies: [
                .product(name: "Argument", package: "swift-argument"),
                .product(name: "Text", package: "swift-text"),
            ]
        ),
        .testTarget(
            name: "Argument Text Tests",
            dependencies: [
                .product(name: "Argument", package: "swift-argument"),
                .product(name: "Text", package: "swift-text"),
            ],
            path: "Tests/Argument Text Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
