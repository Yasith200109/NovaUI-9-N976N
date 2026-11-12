# Build guide (planning)

There is no reproducible build recipe yet. First audit and pin the upstream ROM base, device tree, kernel, toolchain, and licenses.

## Host strategy
Use GitHub Actions for linting, metadata validation, and documentation checks. Do not assume standard hosted runners have sufficient disk/RAM for a full Android build. Evaluate a dedicated Linux build host only after upstream requirements are known.

## Required records
- Upstream repository URLs and immutable commit IDs.
- License and redistribution notes for every source.
- Build host OS, toolchain, environment, and dependency versions.
- Build command and complete non-sensitive logs.
- Artifact hash and exact target model.

No automated flashing or partition modification is permitted.
