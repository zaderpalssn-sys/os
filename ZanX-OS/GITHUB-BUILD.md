# Build ZanX OS on GitHub Actions

This repository contains a ready-to-use GitHub Actions workflow. It builds the ZanX OS ISO on a GitHub-hosted Ubuntu runner, so Windows does not need Docker, WSL, VirtualBox, or a Linux installation.

## 1. Create a GitHub repository

Create a new repository on GitHub. A public repository is the simplest option for avoiding private-repository Actions-minute limits.

## 2. Upload the whole ZanX-OS folder

Upload all files and folders, including:

```text
.github/workflows/build-zanx.yml
build-zanx.sh
config/
docker/
assets/
...
```

The `.github/workflows/build-zanx.yml` file is what makes the **Run workflow** button appear.

## 3. Start the build

Open the repository on GitHub and go to:

**Actions → Build ZanX OS → Run workflow**

Choose the `main` branch and press **Run workflow**.

## 4. Download the ISO

When the workflow finishes with a green check:

**Actions → Build ZanX OS → latest run → Artifacts**

Download the artifact named something like:

```text
ZanX-OS-ISO-1
```

It contains the bootable ZanX ISO and its SHA256 checksum.

## Notes

- The workflow uses Ubuntu 24.04 as the build host.
- The ZanX source files are not edited by the workflow.
- Debian 13/Trixie packages are downloaded during the live-build process.
- The build can take a while because it creates a complete bootable Linux image.
- GitHub-hosted artifact retention is set to 14 days by this workflow.
