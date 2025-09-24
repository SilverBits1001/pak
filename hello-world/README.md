# Hello World Next UI Pak

This directory contains a minimal reference pak that can be sideloaded on a
TrimUI Brick running the community “Next UI” firmware. It provides a single
menu with three dummy entries and shows how to push another screen with lorem
ipsum placeholder text. Pressing the `B` button pops the detail screen and
pressing `B` while on the root menu exits the pak.

## Building the `.pak`

The pak format is just a `zip` archive with the `.pak` extension. From the root
of this repository you can run:

```bash
./tools/make-dist.sh
```

The script will place `hello-world.pak` in `dist/` which can then be copied to
`/roms/paks/` on the TrimUI’s SD card.

## File layout

```
hello-world/
├── manifest.json   # Metadata consumed by the launcher
├── main.lua        # Application entry point
└── README.md       # This file
```

Feel free to expand the menu items, hook into real applications, or replace the
lorem ipsum text with your own content.
