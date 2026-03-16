// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

// ─────────────────────────────────────────────────────────────────
// Selección de entorno FaceTec
// Opción A (Xcode / CLI): exporta la variable antes de abrir Xcode:
//   export FACETEC_ENV=dev
// ─────────────────────────────────────────────────────────────────
let devMode = ProcessInfo.processInfo.environment["FACETEC_ENV"] == "dev"

let faceTecURL = devMode
    ? "https://github.com/Autentikar/facetec-development-dependency.git"
    : "https://github.com/Autentikar/faceTec-dependency.git"

let faceTecPackageName = devMode ? "facetec-development-dependency" : "faceTec-dependency"
let name = devMode ? "FaceTecSDKForDevelopment" : "FaceTecSDK"

let package = Package(
    name: "AKFaceTecSwift",
    products: [
        .library(
            name: "AKFaceTecSwift",
            targets: ["AKFaceTecSwiftWrapper"]),
    ],
    dependencies: [
        .package(url: faceTecURL, from: "9.7.112"),
    ],
    targets: [
        .target(
            name: "AKFaceTecSwiftWrapper",
            dependencies: [
                .product(name: name, package: faceTecPackageName),
                .target(name: "AKFaceTecSwift"),
            ],
            path: "AKFaceTecSwiftWrapper"
        ),
        .binaryTarget(
            name: "AKFaceTecSwift",
            path: "AKFaceTecSwift.xcframework")
    ]
)
