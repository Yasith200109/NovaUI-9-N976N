# One UI 9 donor firmware research

## Candidate: Galaxy S26 Korean (SM-S942N)

| Field | Value |
|---|---|
| Model | SM-S942N |
| Device | Galaxy S26 (Korean) |
| CSCs | KOO / KTC / LUC / SKC |
| Candidate build | `S942NKSS6BZK1` |
| Android | 17 |
| One UI | 9 |
| Android security patch | 2026-11-05 |
| Official Samsung record | https://doc.samsungmobile.com/SM-S942N/037049260309/kor.html |

Samsung's update record lists the candidate as an Android 17 release and includes One UI 9 release information. The firmware is therefore a concrete source candidate for package-level research.

Third-party firmware metadata reports:
- SoC: Exynos s5e9965 (Exynos 2600)
- Codename: `m1s`
- Vendor base: Android 16
- Kernel: 6.12.69
- Firmware archive size: approximately 19.5 GB

Reference: https://samfrew.com/download/Galaxy__S26__/ffgc/SKC/S942NKSS6BZK1/S942NOKR6BZK1

## Relevance to NovaUI 9

The SM-S942N firmware is **not** a flashable package for SM-N976N. It is only a possible Samsung system/framework donor for investigation. Do not reuse its bootloader, modem, CP, vendor, kernel, DTB, DTBO, recovery, partition table or other hardware-specific images on `d2xks`.

The target phone is Exynos 9825 with Android 12 / One UI 4.1, an Android 12-era vendor baseline, and a 4.14 kernel. The candidate donor is a much newer Exynos platform with Android 16 vendor and 6.12 kernel. Sharing the Exynos brand does not establish binary compatibility.

## Package inspection checklist

Before adopting this donor:
- Verify the downloaded package's model, CSC, AP/BL/CP/CSC identifiers and cryptographic checksum.
- Inspect partition image names, sizes, filesystem types and dynamic/static partition assumptions.
- Identify system, system_ext, product, vendor, odm, vbmeta, boot, init_boot, vendor_boot, dtbo and recovery layout.
- Inspect build properties, SDK/API level, VNDK, APEX and 64-bit-only app/runtime assumptions.
- Identify Samsung framework and application components that can be separated from donor hardware dependencies.
- Map each donor dependency to an N976N equivalent or a documented compatibility shim.
- Record all patches, source revisions, licenses and provenance.

## Decision

**Status: inspection candidate only; not selected as final donor.**

Compare this candidate with other official One UI 9 builds and existing One UI porting projects. The donor decision requires a written compatibility rationale. No download, cloud provisioning, flashing or paid service activation is authorized by this document.
