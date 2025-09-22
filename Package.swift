// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AKFaceTecSwift",
    products: [
        .library(
            name: "AKFaceTecSwift",
            targets: ["AKFaceTecSwiftWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Autentikar/faceTec-dependency.git", from: "9.7.84"),
    ],
    targets: [
        .target(
            name: "AKFaceTecSwiftWrapper",
            dependencies: [
                .product(name: "FaceTecSDK", package: "faceTec-dependency"),
                .target(name: "AKFaceTecSwift"),
            ],
            path: "AKFaceTecSwiftWrapper"
        ),
        .binaryTarget(
            name: "AKFaceTecSwift",
            path: "AKFaceTecSwift.xcframework")
    ]
)
