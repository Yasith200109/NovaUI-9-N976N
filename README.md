# NovaUI 9 — Galaxy Note10+ 5G (SM-N976N)

An independent Samsung One UI custom-ROM porting project for the exact target **Galaxy Note10+ 5G SM-N976N** (Exynos 9825, `d2xks`).

> **Status: source audit / port architecture. No installable ROM is available.**
>
> The selected product target is **One UI 9 / Android 17**. This is a custom porting objective, not an official Samsung update or a claim of device compatibility.

## Locked project decisions

| Decision | Selected value |
|---|---|
| Device | Samsung Galaxy Note10+ 5G |
| Exact model | SM-N976N |
| Codename / SoC | `d2xks` / Exynos 9825 |
| ROM target | One UI 9 / Android 17 |
| Build host | Cloud Linux server |
| Memory target | 64 GB RAM |
| Storage planning target | 1 TB NVMe |
| CPU planning target | 16 or more vCPUs preferred; validate against chosen build system |
| Stability goal | Daily-use reliability before feature count |

The cloud provider, region, instance type, and budget have **not** been selected. No server has been provisioned and no paid resource has been started.

## Device baseline

- Installed system: Android 12 / One UI 4.1
- AP/build: `N976NKSU2HXJ2`
- CP/baseband: `N976NKOU2HWH3`
- Active CSC: `KOO`
- Android security patch: `2023-08-01`
- Bootloader: user-confirmed unlocked
- Current recovery: stock Samsung Recovery

The AP and CP identifiers differ. This remains an unresolved firmware-pairing item; do not select modem, vendor, boot, or recovery dependencies until the complete official firmware package is verified.

## Porting approach

1. Identify a legally usable One UI 9 / Android 17 donor firmware and pin its exact build.
2. Audit the donor's Android version, security patch, partition layout, boot image format, vendor interface, and required firmware.
3. Reuse only verified `d2xks` target-side configuration and kernel/device support; do not assume another Note10 variant is interchangeable.
4. Build a non-flashing source validation pipeline first.
5. Establish a verified recovery and rollback path before any handset test.

The previously identified EternityROM `fifteen` branch is a One UI 7 reference, not a One UI 9 donor. It may inform build-system and target-configuration research only.

## Repository layout

- `device/d2xks/` — exact target manifest and device notes.
- `docs/` — source audit, cloud build plan, safety, and test policy.
- `build/` — non-destructive build configuration.
- `scripts/` — validation helpers only.

## Safety rules

- Never cross-flash `d2s`, `d2x`, and `d2xks` by assumption.
- Do not put stock firmware, proprietary vendor blobs, modem files, boot images, copyrighted apps, private keys, or personal data in this public repository.
- Keep EFS, IMEI, modem, bootloader, and partition-writing operations out of CI.
- Do not publish an artifact as installable until its exact target, source, packaging, hash, and recovery procedure are verified.
- A successful compile is not proof of bootability; a successful boot is not proof of daily-use stability.

See [device support](docs/DEVICE_SUPPORT.md), [source audit](docs/SOURCE_AUDIT.md), [build guide](docs/BUILD_GUIDE.md), [cloud host plan](docs/CLOUD_BUILD_HOST.md), [installation policy](docs/INSTALLATION.md), and [testing plan](docs/TESTING.md).
