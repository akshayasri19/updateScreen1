// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swiftPackage",
    platforms: [ .iOS(.v17) ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "swiftPackage",
            targets: ["swiftPackage"]),
    ],   
    dependencies: [
        .package(url: "https://github.com/akshayasri19/swiftPackage", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "swiftPackage",
            dependencies: ["swiftPackage"],
            resources: [
//                .process("Sources/Resources"),
                .copy("Sources/swiftPackage/update_screen_framework/Helpers/Resources/Fonts")
//               
                        ],
            
            swiftSettings: [.define("ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS")]
        ),
        .testTarget(
            name: "swiftPackageTests",
            dependencies: ["swiftPackage"]
        ),
       
    ]
)

