# Reference

## `pug:build`

$pug:build: \to \emptyset$

The `pug:build` task reads the `pug` configuration from your `genie.yaml` and executes a Masonry pipeline to build your Pug templates. It locates templates matching the `targets` glob, reads them, compiles them using the Masonry Pug plugin, sets the appropriate extension based on the environment, and writes them to the build directory.

This task automatically registers to run during the Genie `build` lifecycle event.

## `pug:clean`

$pug:clean: \to \emptyset$

The `pug:clean` task acts as an alias to the standard Genie `clean` task, ensuring that artifacts created by the Pug compilation process resolve correctly when cleaning the workspace.

## `pug`

$pug: \to \emptyset$

An alias for `pug:build`.
