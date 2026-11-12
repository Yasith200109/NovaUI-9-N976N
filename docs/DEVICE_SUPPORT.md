# Device support policy

## Target
Primary target: Samsung Galaxy Note10+ 5G, SM-N976N, Exynos 9825. The commonly used codename is `d2xks`, but it must be verified against the exact upstream device tree selected.

## Compatibility rule
Support for SM-N975F (`d2s`), SM-N976B (`d2x`), or any other model does not establish support for SM-N976N. Do not cross-flash.

## Evidence required before claiming support
- Source tree explicitly lists SM-N976N.
- Kernel and device configuration match the target hardware.
- Boot, display, touch, storage, Wi-Fi, Bluetooth, audio, cameras, sensors, NFC, USB, telephony, mobile data, and power management are tested.
- Recovery and rollback procedures are documented.
- Test results identify exact device and firmware revisions.

Current status: planning only; no verified build.
