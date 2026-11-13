# NovaUI 9 — Project execution plan

## Product target

Build an independent Samsung One UI custom ROM port for the exact **Galaxy Note10+ 5G SM-N976N (Exynos 9825, d2xks)**. The selected target is **One UI 9 / Android 17**.

Daily-use stability and preserving Samsung-specific hardware features take priority over the version label. Samsung's official One UI 9 rollout does not list the Note10+ as an eligible model in the rollout information reviewed; this project is an independent port, not an official update.

## Locked project decisions

- Build host: cloud Linux server.
- RAM target: 64 GB.
- Storage planning target: 1 TB NVMe.
- Preferred CPU planning target: 16+ vCPUs, subject to actual build requirements.
- ROM target: One UI 9 / Android 17.
- Cloud provider, instance, region, and budget: not selected.
- No server provisioned; no paid resources started.

## Confirmed handset snapshot

- Model: SM-N976N
- Codename: d2xks
- SoC: Exynos 9825
- Installed system: Android 12 / One UI 4.1
- AP/build: N976NKSU2HXJ2
- CP/baseband: N976NKOU2HWH3
- Android security patch: 2023-08-01
- Active CSC: KOO
- Bootloader: user-confirmed unlocked
- Recovery: stock Samsung Recovery
- Bootloader binary: U2 inferred from AP; Download Mode rollback state not independently verified

The AP and CP strings differ. Do not select modem, vendor, boot, or recovery dependencies until the complete official stock firmware package and partition contract are verified.

## Execution phases and exit criteria

### Phase 0 — Safety and baseline
- Preserve the exact handset manifest.
- Keep Android security patch separate from Google Play system update.
- Verify the complete official firmware pairing and partition information using non-destructive inspection.
- Exit: baseline reviewed and unresolved items documented.

### Phase 1 — One UI 9 donor and source audit (current)
- Identify official One UI 9 / Android 17 donor firmware candidates.
- Compare donor SoC/platform, vendor interface, partition layout, boot image format, and security patch with N976N.
- Audit UN1CA-derived build frameworks and existing d2xks target configuration; EternityROM's current audited branch is a One UI 7 reference, not a One UI 9 donor.
- Pin immutable source commits, submodules, licenses, and firmware provenance.
- Exit: donor selected with a written compatibility rationale and source bill of materials.

### Phase 2 — Cloud build environment
- Provision a cloud Linux host only after provider, price, region and storage are approved.
- Target 64 GB RAM and approximately 1 TB NVMe; prefer 16+ vCPUs, then tune based on real workload.
- Build a reproducible environment and retain non-sensitive logs.
- Exit: upstream tools and source checks run reproducibly on the host.

### Phase 3 — Non-flashing baseline build
- Download/extract donor firmware only into private storage.
- Validate target assertions, partition metadata, file formats, patch application and packaging.
- Keep all destructive flashing and partition writes disabled.
- Exit: build pipeline produces an inspectable engineering artifact and complete checksum/log record; this is not yet permission to flash.

### Phase 4 — Device bring-up
- Integrate verified d2xks-specific configuration and compatible kernel support.
- Establish a tested recovery/rollback route before any write operation.
- Only then, with explicit user approval, test incrementally on the exact SM-N976N.
- Exit: first bootable engineering build and documented known issues.

### Phase 5 — Samsung feature integration
Test independently on the exact handset:
- boot, display, touch, sensors and charging
- SIM detection, mobile data, voice calls, SMS and IMS/VoLTE where supported
- Wi-Fi, Bluetooth, NFC, GPS and USB
- cameras, microphones, speakers and audio routing
- fingerprint, face unlock if supported, S Pen/Air Command and pressure input
- Samsung services, Knox-dependent features, Secure Folder, DeX and wearable integration where technically possible

Do not promise Knox-dependent features after bootloader unlock or custom software.

### Phase 6 — Stability and release
- Repeated reboot, sleep/wake, charging, thermal, battery, radio and camera tests.
- Verify encryption, data migration, update strategy, recovery and rollback.
- Publish checksums, exact model/firmware requirements, installation instructions and known limitations.
- Exit: release candidate passes the public test matrix on SM-N976N with a verified recovery path.

## Safety and release rules

- No cross-flashing d2s, d2x and d2xks by assumption.
- No modem, EFS, IMEI, bootloader or partition-writing operations in CI.
- Never commit proprietary Samsung firmware, vendor blobs, modem files, boot images, copyrighted apps, private keys, backups or personal data.
- Do not publish an image as installable until its target, source revision, hash, packaging and recovery procedure are verified.
- Compiling is not booting; booting is not daily-use stability.
- Keep planning, source-audited, buildable, boot-tested, feature-tested and release-ready as separate statuses.

## Current status

**One UI 9 donor/source audit in progress.** No donor has been selected, no cloud host has been provisioned, and no NovaUI ROM/recovery/kernel artifact has been built or validated. No flashing is authorized.
