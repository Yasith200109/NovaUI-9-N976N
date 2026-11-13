# Device support and source audit

## Target identity and selected objective

- Device: Samsung Galaxy Note10+ 5G (Korean variant)
- Exact model: `SM-N976N`
- SoC: Exynos 9825
- Codename: `d2xks`
- Installed baseline: Android 12 / One UI 4.1
- Selected custom-port target: One UI 9 / Android 17

Samsung has announced One UI 9 based on Android 17, but the Note10+ is not shown as an eligible official upgrade in the current public rollout information reviewed for this audit. NovaUI 9 is therefore an independent porting effort, not an official OTA path.

## One UI 9 donor candidate — inspection only

A current Korean One UI 9 firmware candidate has been identified:

| Field | Candidate |
|---|---|
| Donor model | Galaxy S26 (Korean), SM-S942N |
| CSC | KOO |
| Firmware | `S942NKSS6BZK1` |
| Android / One UI | Android 17 / One UI 9 |
| Android security patch | 2026-11-05 |
| Samsung update record | [Official Samsung firmware changelog](https://doc.samsungmobile.com/SM-S942N/037049260309/kor.html) |

Third-party firmware metadata identifies this donor as Exynos s5e9965 / codename `m1s`, with Android 16 vendor base and a 6.12.69 kernel. Those details must be independently verified against the actual firmware package before use.

**Important:** This is an inspection candidate for Samsung system/framework research only. It is not a compatible N976N firmware package. Do not flash it, and do not reuse its kernel, vendor, modem, boot, dtbo, recovery or partition images on `d2xks`.

The donor's Exynos 2600 platform, Android 16 vendor baseline and 6.12 GKI-era kernel are substantially different from the target's Exynos 9825, Android 12 vendor baseline and 4.14 kernel. The framework port may therefore require significant compatibility work. Donor selection remains provisional until package-level analysis is complete.

## Candidate source findings

| Component | Candidate | Verified evidence | Decision / remaining work |
|---|---|---|---|
| Samsung UX build framework | [Ocin4ever/EternityROM](https://github.com/Ocin4ever/EternityROM), branch `fifteen` | README maps `d2xks` to N976N and documents UN1CA-based firmware extraction/patch/package workflow. Its stated ROM base is One UI 7 / S24+ firmware. | **Not a One UI 9 donor.** Retain as a build-system and Note10 target reference only. Inspect exact target config, license, and immutable revision before reusing code. |
| N976N target config | EternityROM `target/d2xks/config.sh` | Explicit model assertion SM-N976N, Exynos 9825, Android API 31, EROFS, static/system-image layout, 60 Hz display profile, ultrasonic fingerprint sensor. | Configuration describes an older Android/API baseline. Do not carry values into Android 17 without validating them against the donor firmware and actual handset. |
| Kernel | [ExtremeXT/android_kernel_samsung_exynos9820](https://github.com/ExtremeXT/android_kernel_samsung_exynos9820) | README lists N976N / `d2xks`; `extreme_d2xks_defconfig` sets Exynos 9825 and CONFIG_MODEL_D2XKS. Build script has a `d2xks` board branch. | Candidate only. Pin commit, inspect full device-tree/driver status, kernel ABI and Android 17 compatibility. The README's sample command targets `beyond2lte`, not N976N; do not copy it as the target build command. |
| Recovery/device tree reference | [ExtremeXT/android_device_samsung_exynos9820](https://github.com/ExtremeXT/android_device_samsung_exynos9820) | Exynos 9820/9825 Note10 family recovery reference. | README has an apparent N976B duplication in its model table and a non-N976N build example. Not a verified recovery recipe. |
| AOSP-family reference | [LineageOS d2x device page](https://wiki.lineageos.org/devices/d2x/) | Lists N976B and N976N within the d2x family. | Does not prove Samsung UX, modem, recovery, or kernel cross-compatibility. |
| One UI 8.5 lab reference | [Star7-ROM / oneui8.5-lab](https://github.com/samsunggithub/oneui85-lab) | Repository search exposes a d2xks target config and One UI 8.5-oriented UN1CA-derived project structure. | Treat as an independent research lead only. Verify repository provenance, branch, licenses, actual source firmware, build results, and current maintainer status before relying on it. It is not evidence of a One UI 9 build. |

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

1. Obtain/inspect the SM-S942N One UI 9 firmware metadata privately and verify all partition, filesystem, boot image, framework and vendor details.
2. Compare the S26 donor with alternative One UI 9 donor models and write a compatibility rationale before selecting a source.
3. Pin immutable commits for the chosen build framework, d2xks config, kernel, recovery reference and tools.
4. Inspect license/provenance and document modifications before copying upstream code.
5. Resolve the handset's complete stock firmware pairing and partition contract without writing to the phone.
6. Produce a source bill of materials and a reproducible, non-flashing build/validation pipeline.

## Current status

**One UI 9 donor/source audit in progress.** No donor has been selected, no cloud host has been provisioned, and no NovaUI ROM/recovery/kernel artifact has been built or validated. No flashing is authorized.
