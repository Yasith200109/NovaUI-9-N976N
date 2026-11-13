# Cloud build host specification

## Approved project-level capacity target

- Deployment type: cloud Linux VM or dedicated instance.
- RAM: 64 GB.
- Storage: 1 TB NVMe target.
- CPU: prefer 16 or more vCPUs; exact count depends on provider and measured build load.
- Architecture: x86_64.
- OS candidate: Ubuntu 24.04 LTS, subject to the selected upstream build system's compatibility requirements.

These are planning targets, not a confirmed provider SKU or a guarantee that every build will fit. Actual disk/RAM usage must be measured after the donor and build framework are selected.

## Not yet approved or configured

- Provider and product family.
- Region and data residency.
- Monthly/hourly budget and maximum runtime.
- Persistent disk and snapshot policy.
- SSH access and firewall rules.
- Private firmware storage and signing-key storage.
- Billing account or paid resource activation.

No infrastructure should be provisioned until the user explicitly approves the provider, instance, region, and cost.

## Security baseline

- SSH key authentication only; disable password login where practical.
- Restrict SSH ingress to the user's trusted IP or a secure access gateway.
- Keep firmware and proprietary extracted blobs on private encrypted storage.
- Keep signing keys outside Git and outside CI logs.
- Use a separate unprivileged build account.
- Snapshot the clean host image before toolchain installation and before major source changes.
- Shut down or destroy idle compute when not needed; retain only explicitly requested persistent storage.

## First host validation tasks

1. Confirm OS release and x86_64 architecture.
2. Record CPU model, vCPU count, RAM, swap, disk size, filesystem and free space.
3. Install only the audited build dependencies.
4. Verify available disk after checkout and firmware extraction.
5. Run non-destructive source and patch tests before any ROM image build.
6. Save redacted environment inventory and build logs to the private project records.

## Current status

Specification only. No cloud provider selected, no VM created, no paid service activated.
