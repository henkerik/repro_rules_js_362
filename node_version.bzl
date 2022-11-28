def _node_version_impl(ctx):
    node_toolchain = ctx.toolchains["@rules_nodejs//nodejs:toolchain_type"]
    path = node_toolchain.nodeinfo.target_tool_path

    outputs = ctx.actions.declare_file("node_version")

    command = path + " --version > " + outputs.path

    ctx.actions.run_shell(
        inputs = [],
        outputs = [outputs],
        tools = node_toolchain.nodeinfo.tool_files,
        command = command
    )

    return [DefaultInfo(files = depset([outputs]))]

node_version = rule(
    implementation = _node_version_impl,
    toolchains = ["@rules_nodejs//nodejs:toolchain_type"]
)