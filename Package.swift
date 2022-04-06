// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "SwiftGenPlugin",
    products: [
        .plugin(
            name: "SwiftGenPlugin",
            targets: ["SwiftGenPlugin"]
        )
    ],
    targets: [
        .plugin(
            name: "SwiftGenPlugin",
            capability: .buildTool(),
            dependencies: [
                "SwiftGenBinary"
            ]
        ),
        .binaryTarget(
            name: "SwiftGenBinary",
            path: "Binaries/SwiftGenBinary.artifactbundle"
        )
    ]
)
