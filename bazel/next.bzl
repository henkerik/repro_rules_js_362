load("@aspect_rules_js//js:defs.bzl", "js_run_binary", "js_run_devserver")

def next(
        name,
        srcs,
        data,
        next_js_binary,
        next_bin,
        next_build_out = ".next",
        **kwargs):
    """From https://github.com/aspect-build/bazel-examples/tree/main/next.js"""

    js_run_binary(
        name = name,
        tool = next_js_binary,
        args = ["build"],
        srcs = srcs + data,
        outs = [next_build_out],
        chdir = native.package_name(),
        **kwargs
    )

    js_run_devserver(
        name = "{}_dev".format(name),
        command = next_bin,
        args = ["dev"],
        data = srcs + data,
        chdir = native.package_name(),
        **kwargs
    )

    js_run_devserver(
        name = "{}_start".format(name),
        command = next_bin,
        args = ["start"],
        data = data + [":{}".format(name)],
        chdir = native.package_name(),
        **kwargs
    )
