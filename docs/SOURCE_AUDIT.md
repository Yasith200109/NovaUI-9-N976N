# Device support and source audit

## Target identity

- Marketing name: Samsung Galaxy Note10+ 5G
- Exact model: SM-N976N (Korean variant)
- SoC: Exynos 9825
- Candidate device codename: `d2xks`

The codename is no longer merely speculative: the public EternityROM README explicitly maps `d2xks` to SM-N976N, and the ExtremeKernel README lists N976N / d2xks as a supported kernel target. The physical handset identity and current firmware still need to be captured before any device operation.

## Candidate upstream sources (research only; not yet adopted)

| Component | Candidate | What is verified | Remaining concern |
|---|---|---|---|
| Samsung UX ROM base | [Ocin4ever/EternityROM](https://github.com/Ocin4ever/EternityROM), branch `fifteen` | README lists d2xks / N976N; describes a UN1CA-based One UI 7 port | Need inspect the exact d2xks target config, source revision, build reproducibility and hardware test history |
| Kernel | [ExtremeXT/android_kernel_samsung_exynos9820](https://github.com/ExtremeXT/android_kernel_samsung_exynos9820) | README lists N976N / d2xks; repository has `extreme_d2xks_defconfig` with Exynos 9825 and D2XKS model config | Need pin commit, inspect build script/toolchain, verify compatibility with selected ROM base and firmware |
| Recovery/device tree reference | [ExtremeXT/android_device_samsung_exynos9820](https://github.com/ExtremeXT/android_device_samsung_exynos9820) | TWRP tree covers Exynos 9820/9825 Note10 family | README table has an apparent model typo (N976B repeated for d2xks); its build example targets beyond2lte, not d2xks. Do not treat this as a ready N976N recovery recipe |
| AOSP-family reference | [LineageOS d2x device page](https://wiki.lineageos.org/devices/d2x/) | Device page lists SM-N976B and SM-N976N under d2x | This is a separate device support path, not proof that Samsung UX ports or arbitrary d2x packages support N976N |

## Important distinctions

- `d2s` = SM-N975F. Not our target.
- `d2x` = SM-N976B. Related, but not interchangeable by assumption.
- `d2xks` = SM-N976N. Our intended target.
- A shared LineageOS device family does not imply every Samsung firmware, kernel, recovery or ROM package is cross-compatible.
- ImpulseROM's published Android 16 development scope has explicitly cautioned against expanding to d2xks before its d2s target is validated. Do not use its d2s build as an N976N image.

## Next verification tasks

1. Capture the physical phone's model, Android build, AP/PDA, CP/baseband, CSC and bootloader revision.
2. Inspect EternityROM branch `fifteen` target configuration for d2xks and identify exact stock firmware requirements.
3. Inspect kernel commit, defconfig, build script, toolchain and output packaging for d2xks.
4. Resolve recovery/device-tree model mapping and partition assumptions with primary upstream evidence.
5. Record licenses and provenance for every source before copying or modifying files.
6. Define a no-flash bring-up test plan and rollback procedure.

## Current project status

Planning / source audit. No NovaUI ROM image, recovery image, kernel package or flashable artifact has been built or validated. No flashing is authorized by this document.
