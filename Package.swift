// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "MySourceGenPlugin",
    products: [
        .plugin(
            name: "MySourceGenBuildToolPlugin",
            targets: ["MySourceGenBuildToolPlugin"]
        ),
        .executable(
            name: "MySourceGenBuildTool",
            targets: ["MySourceGenBuildTool"]
        ),
        .plugin(
            name: "MySourceGenPrebuildPlugin",
            targets: ["MySourceGenPrebuildPlugin"]
        ),
    ],
    targets: [
        .executableTarget(
            name: "MyLocalTool",
            plugins: [
                "MySourceGenBuildToolPlugin",
            ]
        ),
        .executableTarget(
            name: "MyOtherLocalTool",
            plugins: [
                "MySourceGenPrebuildPlugin",
            ]
        ),
        .plugin(
            name: "MySourceGenBuildToolPlugin",
            capability: .buildTool(),
            dependencies: [
                "MySourceGenBuildTool",
            ]
        ),
        .plugin(
            name: "MySourceGenPrebuildPlugin",
            capability: .buildTool()
        ),
        .executableTarget(
            name: "MySourceGenBuildTool",
            dependencies: [
                "MySourceGenBuildToolLib",
            ]
        ),
        .target(
            name: "MySourceGenBuildToolLib"
        ),
        .target(
            name: "MySourceGenRuntimeLib"
        ),
        .testTarget(
            name: "MySourceGenPluginTests",
            dependencies: [
                "MySourceGenRuntimeLib",
            ],
            plugins: [
                "MySourceGenBuildToolPlugin",
                "MySourceGenPrebuildPlugin",
            ]
        )
    ]
)
