# Technical Notes

### Preset Architecture and Auto-Registration

Genie Pug implements the Genie preset architecture to bundle configuration, dependencies, and complex task orchestration into a single unit. It eliminates the need to manually wire transpilation steps into your build process.

Genie automatically registers the preset without requiring explicit manual initialization. During startup, Genie scans the host project's `devDependencies`. Because the package is prefixed with `genie-` (i.e., `@dashkite/genie-pug`), Genie automatically discovers and initializes it. This inversion of control provides a seamless experience for creators, removing boilerplate configuration.

### Lifecycle Composition

The preset leverages deep composition to integrate its specific functionality into the broader build pipeline. Rather than forcing creators to invoke Pug-specific commands, Genie Pug binds its specialized domain tasks (`pug:build` and `pug:clean`) to generalized shared lifecycle tasks (`build` and `clean`).

When a creator invokes `npx genie build`, the task manager automatically triggers the Pug compilation pipeline alongside any other registered presets. This design guarantees consistent behavior and coordination across all DashKite repositories without manual intervention.

### Dynamic Configuration Evaluation

Genie Pug reads its options dynamically from the Genie configuration during the execution of the `pug:build` task. This re-entrant approach ensures that any changes to the configuration, such as those made by Data Representation Notation (DRN) adjustments during runtime, take effect correctly during compilation.

### Masonry Integration

The compilation pipeline relies on the Masonry task runner. It utilizes `masonry-targets` for globbing input files and defining output destinations, `masonry-hooks` for reading file contents, and `masonry-pug` for executing the actual template compilation.
