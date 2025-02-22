// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CountryCallingCode",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CountryCallingCode",
            targets: ["CountryCallingCode"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CountryCallingCode",
            resources: [
                .process("Countries.json")  // Make sure the JSON file is placed under the Resources folder
            ]),
        .testTarget(
            name: "CountryCallingCodeTests",
            dependencies: ["CountryCallingCode"]
        ),
    ]
)
