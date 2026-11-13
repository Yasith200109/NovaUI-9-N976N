# Device support and source audit

## Target identity and selected objective

- Device: Samsung Galaxy Note10+ 5G (Korean variant)
- Exact model: `SM-N976N`
- SoC: Exynos 9825
- Codename: `d2xks`
- Installed baseline: Android 12 / One UI 4.1
- Selected custom-port target: One UI 9 / Android 17

Samsung has announced One UI 9 based on Android 17, but the Note10+ is not shown as an eligible official upgrade in the current public rollout information reviewed for this audit. NovaUI 9 is therefore an independent porting effort, not an official OTA path.

## Candidate source findings

| Component | Candidate | Verified evidence | Decision / remaining work |
|---|---|---|---|
| Samsung UX build framework | [Ocin4ever/EternityROM](https://github.com/Ocin4ever/EternityROM), branch `fifteen` | README maps `d2xks` to N976N and documents UN1CA-based firmware extraction/patch/package workflow. Its stated ROM base is One UI 7 / S24+ firmware. | **Not a One UI 9 donor.** Retain as a build-system and Note10 target reference only. Inspect exact target config, license, and immutable revision before reusing code. |
| N976N target config | EternityROM `target/d2xks/config.sh` | Explicit model assertion SM-N976N, Exynos 9825, Android API 31, EROFS, static/system-image layout, 60 Hz display profile, ultrasonic fingerprint sensor. | Configuration describes an older Android/API baseline. Do not carry values into Android 17 without validating them against the donor firmware and actual handset. |
| Kernel | [ExtremeXT/android_kernel_samsung_exynos9820](https://github.com/ExtremeXT/android_kernel_samsung_exynos9820) | README lists N976N / `d2xks`; `extreme_d2xks_defconfig` sets Exynos 9825 and CONFIG_MODEL_D2XKS. Build script has a `d2xks` board branch. | Candidate only. Pin commit, inspect full device-tree/driver status, kernel ABI and Android 17 compatibility. The README's sample command targets `beyond2lte`, not N976N; do not copy it as the target build command. |
| Recovery/device tree reference | [ExtremeXT/android_device_samsung_exynos9820](https://github.com/ExtremeXT/android_device_samsung_exynos9820) | Exynos 9820/9825 Note10 family recovery reference. | README has an apparent N976B duplication in its model table and a non-N976N build example. Not a verified recovery recipe. |
| AOSP-family reference | [LineageOS d2x device page](https://wiki.lineageos.org/devices/d2x/) | Lists N976B and N976N within the d2x family. | Does not prove Samsung UX, modem, recovery, or kernel cross-compatibility. |
| One UI 8.5 lab reference | [Star7-ROM / oneui8.5-lab](https://github.com/samsunggithub/oneui85-lab) | Repository search exposes a d2xks target config and One UI 8.5-oriented UN1CA-derived project structure. | Treat as an independent research lead only. Verify repository provenance, branch, licenses, actual source firmware, build results, and current maintainer status before relying on it. It is not evidence of a One UI 9 build. |

## One UI 9 donor firmware — blocking decision

No donor firmware has yet been selected or pinned. Before implementation, record:

1. Exact donor model and region/CSC.
2. Full firmware build identifier and Android 17 / One UI 9 confirmation.
3. Firmware download provenance and terms; keep proprietary firmware private.
4. AP/PDA, BL, CP, CSC and security patch levels.
5. Partition map, dynamic/static partition assumptions, filesystem formats, boot/vendor_boot/init_boot/dtbo layout, AVB and encryption expectations.
6. Donor framework/vendor interface and the compatibility strategy for the N976N's Android 12-era vendor and Exynos 9825 kernel.
7. Exact d2xks-specific patches and known regressions.

A donor from a newer Snapdragon or different Exynos platform is not automatically usable. Prefer a donor whose framework architecture and hardware platform provide the most realistic compatibility path, and document why it was selected.

## Device-specific baseline concerns

- Current AP/build: `N976NKSU2HXJ2`
- Current CP/baseband: `N976NKOU2HWH3`
- Active CSC: `KOO`
- Android security patch: `2023-08-01`
- Bootloader: user-confirmed unlocked; binary `2` inferred from AP string only
- Recovery: stock Samsung Recovery
- AP/CP suffix mismatch remains unresolved until the complete official package is inspected.

The installed Android 12 / API 31 vendor baseline is older than Android 17. A successful file-system repack or framework patch is not proof that the resulting system can use the existing vendor stack. Binder, VNDK, SELinux, media, graphics, camera, audio, radio, and init compatibility are major bring-up risks.

## Variant rules

- `d2s` = SM-N975F. Not our target.
- `d2x` = SM-N976B. Related, but not interchangeable by assumption.
- `d2xks` = SM-N976N. Our exact target.
- Never use a kernel, recovery, boot image, or ROM solely because it says Note10+.

## Required next audit tasks

1. Identify candidate official One UI 9 donor builds and choose one only after comparing platform, SoC, vendor and partition compatibility.
2. Pin immutable commits for the chosen build framework, d2xks config, kernel, recovery reference and tools.
3. Inspect license/provenance and document modifications before copying upstream code.
4. Resolve the handset's complete stock firmware pairing and partition contract without writing to the phone.
5. Produce a source bill of materials and a reproducible, non-flashing build/validation pipeline.

## Current status

**Source audit / port architecture.** No NovaUI ROM image, custom recovery, kernel package, or flashable artifact has been built or validated. No handset flashing is authorized by this audit.
