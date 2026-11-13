# NovaUI 9 — Project execution plan

## Product target

Build an independent Samsung One UI-based custom ROM project for the exact target **Galaxy Note10+ 5G SM-N976N (Exynos 9825, d2xks)**. The desired UX target is One UI 9 / Android 17, but this is an exploratory port target, not a claim of official Samsung support or current compatibility.

Daily-use stability and preserving Samsung-specific hardware features take priority over visual version labels. No source or binary is considered compatible merely because it targets another Note10-family model.

## Confirmed handset snapshot

- Model: SM-N976N
- Codename: d2xks
- SoC: Exynos 9825
- Installed system: Android 12 / One UI 4.1
- Build/AP: N976NKSU2HXJ2
- CP/baseband: N976NKOU2HWH3
- Android security patch: 2023-08-01
- Active CSC: KOO
- Bootloader: user-confirmed unlocked
- Recovery: stock Samsung recovery
- Bootloader binary inferred from AP string: U2; Download Mode rollback state is not independently verified

The AP and CP strings differ. This is recorded as an unresolved firmware pairing. Do not select modem, vendor, boot or recovery dependencies until the exact stock firmware package and partition compatibility are verified.

## Execution phases and exit criteria

### Phase 0 — Safety and baseline (in progress)
- Preserve the exact handset manifest and distinguish Android security patch from Google Play system update.
- Capture non-sensitive build properties and source provenance.
- Do not write to partitions or flash experimental images.
- Exit: device identity and firmware baseline reviewed; unresolved items explicitly documented.

### Phase 1 — Upstream source audit (next)
- Inspect the exact d2xks target configuration in the candidate Samsung UX ROM project.
- Pin immutable commit IDs for ROM framework/build system, device configuration, kernel, recovery and required tools.
- Inspect licenses, notices, source availability and redistribution restrictions before importing anything.
- Verify build instructions, toolchain versions, required firmware, partition layout and image packaging.
- Exit: a reproducible source bill of materials and a justified N976N bring-up architecture.

### Phase 2 — Build environment
- Establish a Linux build host with the disk, RAM and CPU capacity required by the selected upstream build system.
- Keep GitHub Actions limited to lint, metadata checks and lightweight tests unless a suitable dedicated runner is available.
- Add reproducible setup scripts and capture build logs without secrets or proprietary payloads.
- Exit: upstream baseline build can be reproduced before NovaUI-specific modifications.

### Phase 3 — Device bring-up
- Integrate only verified d2xks-specific configuration and compatible kernel sources.
- Keep stock firmware/vendor dependencies separate from redistributable source.
- Add boot, recovery and SELinux configuration only after matching partition and firmware assumptions are confirmed.
- Exit: first bootable engineering build with a documented known-issues list. No daily-use claim.

### Phase 4 — Samsung feature integration
Validate independently on the exact SM-N976N:
- boot, display, touch, sensors and charging
- SIM detection, cellular data, voice calls, SMS and IMS/VoLTE where supported
- Wi-Fi, Bluetooth, NFC, GPS and USB
- cameras, microphones, speakers and audio routing
- fingerprint, face unlock if supported, S Pen/Air Command and pressure input
- Samsung account/services, Secure Folder/Knox-dependent features, DeX and wearable integration where technically and legally possible

Do not promise that Knox-dependent features will work after bootloader unlock or custom software. Record failures honestly.

### Phase 5 — Stability and release
- Run repeated reboot, sleep/wake, charging, thermal, battery, radio and camera tests.
- Verify OTA/update strategy, data migration behavior, encryption and recovery/rollback path.
- Produce checksums, exact supported model/firmware requirements, installation instructions and known limitations.
- Exit: release candidate passes the published test matrix on the exact target, with a verified recovery path and user consent for device testing.

## Safety and release rules

- No cross-flashing between d2s, d2x and d2xks without explicit verified support.
- No modem, EFS, IMEI, bootloader or partition-writing operations in CI.
- Never commit proprietary Samsung firmware, vendor blobs, modem files, boot images, copyrighted apps, private keys, backups or personal data.
- Do not publish an image as installable until its target, source revision, hash, packaging and recovery procedure are verified.
- A build that compiles is not automatically bootable; a build that boots is not automatically daily-use stable.
- Keep a clear distinction between planning, source-audited, buildable, boot-tested, feature-tested and release-ready states.

## Current status

**Planning / source audit.** No NovaUI ROM image, custom recovery image, kernel package or flashable artifact has been built or validated. The One UI 9 / Android 17 target remains a research objective until upstream compatibility and required firmware dependencies are proven.
