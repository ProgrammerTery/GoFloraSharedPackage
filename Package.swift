// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "GoFloraSharedPackage",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        // Main product with all DTOs
        .library(
            name: "GoFloraSharedPackage",
            targets: ["ClientDTO", "DriversDTO", "PaymentDTO", "TripDTO", "SharedModels"]
        ),
        // Individual products for granular imports
        .library(name: "ClientDTO", targets: ["ClientDTO"]),
        .library(name: "DriversDTO", targets: ["DriversDTO"]),
        .library(name: "PaymentDTO", targets: ["PaymentDTO"]),
        .library(name: "TripDTO", targets: ["TripDTO"]),
        .library(name: "SharedModels", targets: ["SharedModels"])
    ],
    dependencies: [
        // Vapor for Content protocol
        .package(url: "https://github.com/vapor/vapor.git", from: "4.99.0")
    ],
    targets: [
        .target(
            name: "ClientDTO",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .target(
            name: "DriversDTO",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .target(
            name: "PaymentDTO",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .target(
            name: "TripDTO",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .target(
            name: "SharedModels",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                "ClientDTO",
                "DriversDTO",
                "PaymentDTO",
                "TripDTO"
            ]
        ),
        .testTarget(
            name: "GoFloraSharedPackageTests",
            dependencies: ["ClientDTO", "DriversDTO", "PaymentDTO", "TripDTO", "SharedModels"]
        )
    ]
)
