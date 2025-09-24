# TrimUI Brick Next UI Hello World Pak

This repository contains a reference pak that demonstrates a simple menu-driven
application for the TrimUI Brick running the Next UI launcher. The example
shows how to:

- Display a scrollable menu the player can navigate with the D-Pad or stick.
- Enter a secondary screen with placeholder text.
- Use the `B` button to go back and exit the pak.

## Repository layout

```
hello-world/       # Source files for the pak
└── main.lua       # Entry point used by Next UI
└── manifest.json  # Metadata consumed by the launcher
dist/              # Build artefacts (created after running the build script)
tools/make-dist.sh # Helper script that zips the pak
```

## Building

The pak format is just a zip archive with a `.pak` extension. Run the helper
script to create `dist/hello-world.pak`:

```bash
./tools/make-dist.sh
```

If you have the SD card mounted on your computer you can pass the destination
path (usually `roms/paks/`) and the script will copy the pak for you:

```bash
./tools/make-dist.sh /media/trimui/roms/paks
```

Otherwise copy `dist/hello-world.pak` to `roms/paks/` on the TrimUI Brick SD
card to test it.

## Installation

1. Build the pak (or download the pre-built archive from a release) so that you
   have `dist/hello-world.pak` available on your computer.
2. Insert the TrimUI Brick SD card into your computer (or mount it over USB)
   and open the `roms/paks/` directory used by Next UI.
3. Copy `hello-world.pak` into `roms/paks/`. You can optionally create a
   sub-folder if you prefer to organise custom paks.
4. Safely eject the SD card, insert it back into the TrimUI Brick, and launch
   Next UI. The “Hello World” entry will now appear in the Pak list.


## Customisation ideas

- Replace the menu entries in `hello-world/main.lua` with launchers for your own
  scripts or emulators.
- Change the lorem ipsum placeholder text to whatever you need to display.
- Add additional screens by pushing more `nextui.screens.Text` or
  `nextui.screens.List` instances onto the stack.
