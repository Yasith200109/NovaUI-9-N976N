# Build environment

Full Android ROM builds are resource-intensive. GitHub-hosted runners are intended here for lightweight validation, not assumed to be capable of compiling a complete Samsung-based ROM.

Before selecting a build host, verify:
- Required Linux distribution and toolchain from the chosen upstream project.
- RAM, CPU, free disk, filesystem, and build-cache requirements.
- Source and binary redistribution licenses.
- Reproducibility and artifact retention policy.

Do not download or inject proprietary Samsung firmware, vendor blobs, modem files, or signing keys through CI. A future build pipeline must be opt-in and must not flash connected devices.
