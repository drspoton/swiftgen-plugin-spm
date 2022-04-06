# SwiftGen SPM Plugin

This is temporary solution until SwiftGen implement it on their side.
https://github.com/SwiftGen/SwiftGen/pull/926

## Usage

#### Package.swift
```swift
    dependencies: [
        .package(url: "https://github.com/drspoton/swiftgen-plugin-spm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "MyTarget",
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
)
```

#### swiftgen.yml
```yml
output_dir: ${DERIVED_SOURCES_DIR}
```
