# Genie Pug

*Genie preset for compiling Pug into HTML or JavaScript*

[![Hippocratic License HL3-CORE](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CORE&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/core.html)

Genie Pug provides a preset for Genie to compile Pug templates into either HTML or JavaScript. It integrates directly into the Genie build lifecycle as an auto-registering plugin.

## Features

- Auto-registers with the Genie lifecycle.
- Provides `pug` and `pug:clean` tasks.
- Configurable via the `genie.yaml` file.

## Installation

```bash
pnpm install -D @dashkite/genie-pug
```

## Usage

Configure the target files in your `genie.yaml`:

```yaml
pug:
  targets:
    - src/**/*.pug
```

Run the build task:

```bash
npx genie pug
```

## Other Resources

- [Reference](docs/reference.md)
- [Recipes](docs/recipes.md)
- [Technical Notes](docs/technical-notes.md)
- [Testing](docs/testing.md)
