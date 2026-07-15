# Recipes

## Compiling Pug Templates

To compile Pug templates, you must configure the preset in your Genie configuration and trigger the build command. Genie Pug handles reading the templates, applying the necessary compilation steps, and writing the output to the build directory.

1. Define your compilation targets in your configuration file.
2. Trigger the task to start the compilation pipeline.
3. Verify the generated output in your build directory.

```yaml
pug:
  targets:
    - src/views/**/*.pug
```

```bash
# start the compilation process
npx genie pug
```

## Configuring Multiple Targets and Exclusions

As your project grows, you may need to compile templates from multiple distinct locations or explicitly exclude certain files (such as partials or layouts) from compiling into standalone artifacts. Genie Pug utilizes standard globbing to support complex target definitions.

1. Add an array of glob strings to the `targets` property.
2. Prefix glob strings with `!` to negate them and exclude matching files.

```yaml
pug:
  targets:
    # include all pug files in views
    - src/views/**/*.pug
    # exclude files that start with an underscore
    - "!src/views/**/_*.pug"
    # include standalone components
    - src/components/**/*.pug
```

```bash
# trigger compilation for all configured targets
npx genie pug
```

## Integrating with the Genie Build Lifecycle

When you need to compile Pug templates alongside other assets (such as CoffeeScript files or CSS), rely on the automatic lifecycle integration. Genie Pug registers itself with the standard build hook, allowing it to run concurrently with other build tasks.

1. Configure your overall build targets across all your Genie plugins.
2. Invoke the standard build command.

```bash
# trigger the standard build lifecycle, executing all registered build tasks
npx genie build
```
