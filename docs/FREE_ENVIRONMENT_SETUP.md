# Free environment setup (Oracle + Kaggle + GitHub)

## Safety boundary

This workflow is designed to stay within free allowances. Do not upgrade Oracle to Pay As You Go, do not enable paid products, and do not attach a billing-enabled Google Cloud project to Kaggle. Stop if a console labels a resource as paid, trial-only, or chargeable. No VM is created by this guide.

## Roles

| Service | Use | Not suitable for |
|---|---|---|
| GitHub | Canonical source, documentation, lightweight CI checks | Full Samsung ROM compilation |
| Kaggle CPU notebook | Temporary Linux preflight, metadata checks, small extraction/patch experiments | Persistent 1 TB workspace or full ROM build |
| Oracle Always Free A1 | Optional ARM utility node for Git/source checks and small automation | x86_64 Android ROM build; 2 OCPU / 12 GB RAM / 200 GB storage is far below the project target |

## 1. GitHub (already prepared)

Repository: https://github.com/Yasith200109/NovaUI-9-N976N
Working branch: `porting/oneui9-d2xks`

The existing GitHub Actions workflow validates project metadata only. It must not be treated as a ROM build. Check its result under **Actions → Validate project metadata**.

## 2. Kaggle setup

1. Sign in at https://www.kaggle.com/ and open **Code → New Notebook**.
2. Keep **Accelerator = None** (CPU is enough for preflight) and enable Internet only when cloning the public repository.
3. Import the repository notebook at `cloud/kaggle_nova_preflight.ipynb`, or create a notebook and copy its cells.
4. Run all cells. Confirm the report shows Linux, available RAM/disk, and the expected device manifest.
5. Save notebook versions when useful. Kaggle documents a 12-hour CPU/GPU session, 4 CPU cores, 30 GB RAM and 20 GB auto-saved working disk; these are session resources, not persistent build storage.
6. Do not publish proprietary Samsung firmware, vendor blobs, modem files, device identifiers, or signing keys as notebook outputs or public datasets. Do not connect paid Google Cloud services.

## 3. Oracle Cloud Always Free (optional; no instance yet)

1. Open https://www.oracle.com/cloud/free/ and review the current Always Free eligibility and terms.
2. If an Oracle account is already available, sign in. If signup requests payment verification, do not approve a paid upgrade or trial conversion; stop if you are unsure.
3. In the OCI Console, inspect **Governance & Administration → Limits, Quotas and Usage** and confirm available Always Free capacity in the home region.
4. Do not create any instance yet. Before any provisioning, verify that the selected shape is explicitly marked **Always Free-eligible**, and that the final review page shows no paid add-ons or chargeable resources.
5. The free A1 allowance is up to 2 OCPUs and 12 GB RAM, with 200 GB total block-volume storage in the home region. This ARM host is only for lightweight utility tasks; it cannot satisfy the x86_64 / 64 GB / 1 TB build-host specification.
6. Oracle may reclaim idle Always Free instances. Keep no important source or firmware only on that VM.

## 4. What we will test first

- Kaggle: environment inventory, public repository checkout, device manifest assertions, shell-script syntax checks.
- Oracle (only after the account and free eligibility are confirmed): architecture/OS inventory, Git connectivity, repository checks.
- GitHub: metadata workflow on pushes and pull requests.

## 5. Never do in this free setup

- No paid compute, storage, snapshots, networking add-ons, or billing upgrades.
- No full Android 17 ROM build on these undersized free resources.
- No flashing, bootloader changes, or device-side commands.
- No public upload of proprietary Samsung firmware, extracted blobs, private keys, or personal device data.

## Current state

Documentation and a Kaggle preflight notebook are prepared in the repository. No Oracle account was accessed, no cloud instance was created, no Kaggle session was started, and no paid resource was activated.
