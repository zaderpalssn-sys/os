# Build notes

The source tree is intentionally self-contained with respect to ZanX branding,
themes, desktop launchers and boot artwork.

The only external build inputs are Debian packages fetched by live-build.

## Why Debian 13

Debian provides a stable, familiar base while allowing the UI layer to be
kept intentionally old-school. Openbox and Tint2 are used instead of a modern
full desktop shell.

## Binary boot artwork

`assets/boot-background.png` and its staged copy under `config/includes.binary/boot/grub/themes/zanx/` is the GRUB
background. `theme.txt` defines the red/gray text treatment.

Exact bootloader integration can vary slightly between live-build versions.
The theme files are therefore kept as a normal source asset rather than relying
on a distro-specific post-build patch.
