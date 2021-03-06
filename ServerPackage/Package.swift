// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ServerPackage",
    platforms: [.macOS(.v10_15)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
      .executable(name: "Run", targets: ["Run"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Vapor", url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(name: "SQLite", url: "https://github.com/vapor/sqlite.git", from: "3.0.0"),
        .package(name: "Auth", url: "https://github.com/vapor/auth.git", from: "2.0.4"),
        .package(name: "FluentSQLite", url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0"),
        .package(name: "Leaf", url: "https://github.com/vapor/leaf.git", from: "3.0.0"),
        .package(path: "../Package")
    ],
    targets: [
      // Targets are the basic building blocks of a package. A target can define a module or a test suite.
      // Targets can depend on other targets in this package, and on products in packages which this package depends on.
      .target(name: "App", dependencies: [
        "Vapor",
        "SQLite",
        "FluentSQLite",
        "Leaf",
        .product(name: "Authentication", package: "Auth"),
        .product(name: "Model", package: "Package")
        ]),
      .target(name: "Run", dependencies: ["App"])
  ]
)
