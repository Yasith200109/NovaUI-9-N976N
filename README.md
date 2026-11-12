# NovaUI 9 — Galaxy Note10+ 5G (SM-N976N)

An independent development workspace for exploring a **One UI 9-inspired** Android experience for Samsung Galaxy Note10+ 5G (Exynos 9825; target codename commonly identified as `d2xks`).

> **Status: Planning / bring-up only. No installable ROM is available.**
>
> This project is independent and is not affiliated with or endorsed by Samsung. “One UI” is a Samsung trademark.

## Goals
- Prioritize stability and daily-use reliability.
- Keep SM-N976N / `d2xks` distinct from related Note10-family variants.
- Document source provenance, device requirements, limitations, and test results.
- Automate safe source/configuration checks before full builds.
- Respect upstream licenses and exclude proprietary Samsung payloads unless redistribution is explicitly permitted.

## Target (to be verified)
| Item | Target |
|---|---|
| Device | Samsung Galaxy Note10+ 5G |
| Model | SM-N976N |
| SoC | Exynos 9825 |
| Device codename | `d2xks` (verify against selected device tree) |
| Bootloader | User-reported unlocked; re-check before any operation |
| Firmware base | Not yet confirmed |

Related models are not interchangeable. Never flash a package unless its maintainer explicitly confirms SM-N976N support.

## Layout
- `device/d2xks/` — target notes and conservative manifest.
- `docs/` — support, build, installation, testing, and firmware policy.
- `build/` — build environment planning.
- `scripts/` — non-destructive validation helpers.
- `.github/workflows/` — lightweight CI checks only.

## Safety
1. Do not upload stock firmware, proprietary vendor blobs, modem files, boot images, copyrighted apps, private keys, or personal data.
2. Do not assume a `d2s`, `d2x`, or other variant build works on `d2xks`.
3. Do not flash experimental builds on a primary device.
4. Record source revision, firmware base, bootloader revision, and test results for every build.
5. Keep EFS, IMEI, modem, bootloader, and partition-writing operations out of CI.
6. Back up important data and establish a recovery plan before device testing.

## Next steps
1. Confirm exact model, Android version, build number, baseband, and bootloader revision.
2. Audit candidate device trees, kernels, ROM base, and licenses.
3. Establish a reproducible `d2xks` bring-up path.
4. Add hardware support only after verification on the exact target.
5. Test incrementally before considering daily-use status.

See [device support](docs/DEVICE_SUPPORT.md), [build guide](docs/BUILD_GUIDE.md), [installation policy](docs/INSTALLATION.md), [testing plan](docs/TESTING.md), and [firmware policy](docs/FIRMWARE_POLICY.md).
