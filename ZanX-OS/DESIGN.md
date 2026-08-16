# ZanX OS visual design specification

## Palette

- Base black: `#090909`
- Window black: `#181818`
- Panel gray: `#242424`
- Border gray: `#606060`
- Accent red: `#9b1018`
- Bright accent: `#c01822`
- Text: `#d0d0d0`

## Era target

The design intentionally borrows visual conventions common to Linux desktops from 2000–2005:

- Openbox-style square window decoration
- small serif/sans system fonts instead of giant modern UI typography
- 24–28px bottom panel
- gray beveled-ish surfaces
- dark red title and hover states
- 32×32 pixel-style icons
- XTerm as a first-class desktop application
- no blur, transparency-heavy cards, Material UI or neon gradients

## Logo

`assets/zanx-ascii.txt` contains the exact supplied ASCII-art string. It is also rendered into the boot and login PNG artwork.

## Functional mapping

The requested Windows-like names are user-facing aliases:

- Explorer → PCManFM
- Notepad → Mousepad
- WinRAR → File Roller / p7zip
- Firefox → Firefox ESR
