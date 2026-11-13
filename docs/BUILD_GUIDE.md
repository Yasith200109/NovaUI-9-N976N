# Build guide — cloud strategy

## Locked decisions

- Build host: cloud Linux server.
- RAM: 64 GB.
- Planning storage target: 1 TB NVMe.
- Preferred CPU: 16 or more vCPUs, subject to measured build-system needs.
- Target: One UI 9 / Android 17 port for SM-N976N (`d2xks`).

The cloud provider, region, instance type, budget, and credentials are not selected. No server is provisioned. Do not create paid infrastructure without explicit user approval.

## Host operating system

Start with a supported 64-bit x86_64 Linux distribution. Ubuntu 24.04 LTS is the initial evaluation candidate because current porting workflows may depend on recent packages; confirm the chosen upstream build system's supported OS and dependency versions before freezing the image.

Do not assume that generic AOSP build requirements exactly match a Samsung firmware repacking/patching workflow. Measure the actual chosen toolchain and build pipeline. Keep enough free disk for source, firmware extraction, temporary decoded APK/JAR trees, output images, caches, and logs.

## Workload separation

- GitHub Actions: linting, shell/YAML validation, manifest checks, and lightweight non-proprietary tests only.
- Cloud host: firmware extraction, APK/JAR decoding and patching, image generation, and full ROM packaging after source and license audit.
- User handset: later hardware testing only after a verified recovery/rollback plan and explicit test approval.

## Security and secret handling

- Never store Samsung firmware, proprietary blobs, signing keys, account tokens, or personal device data in the public repository.
- Use a private, encrypted storage location for legally obtained firmware and private signing material.
- Use least-privilege SSH and repository credentials; do not paste secrets into chat or commit them.
- Disable automated release publishing until artifacts are verified for exact model and checksums.

## Build records required

- Immutable upstream commit IDs and submodule revisions.
- Donor firmware model, region, build ID, Android version, and checksum.
- Host OS image, CPU/RAM/disk details, packages, JDK/toolchain versions.
- Exact build commands, exit codes, and complete non-sensitive logs.
- Artifact filenames, SHA-256 hashes, target assertion, and package inspection results.

## Current gate

No build host or One UI 9 donor firmware has been selected/provisioned. First finish donor and source compatibility research, then select a cloud provider/instance within the user's budget. No paid resources or device flashing are initiated by this guide.
