import PackagePlugin

@main
struct SwiftGenBuildToolPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let swiftgen = try context.tool(named: "swiftgen")
        let config = context.package.directory.appending("swiftgen.yml")
        let output = context.pluginWorkDirectory

        print("swiftgen: \(swiftgen.path)")
        print("config: \(config)")
        print("output: \(output)")

        return [
            .prebuildCommand(
                displayName: "Running \(swiftgen.name)",
                executable: swiftgen.path,
                arguments: [
                    "config",
                    "run",
                    "--config", config
                ],
                environment: [
                    "PROJECT_DIR": context.package.directory,
                    "TARGET_NAME": target.name,
                    "DERIVED_SOURCES_DIR": output,
                ],
                outputFilesDirectory: output
            )
        ]
    }
}
