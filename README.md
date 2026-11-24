# zmk-orbita-layout

Shared logical layout module for Orbita keyboards.

## Purpose

Keep layers, combos, hold-taps, mouse bindings, and shared macros in one place.
Keyboard modules include `include/orbita_layout.keymap.inc` while retaining
their own matrix transforms, pin assignments, and hardware configuration.

## Local Development

This module is an independent Git repository and a West project. Its workspace
path is:

- `modules/zmk/zmk-orbita-layout`

Both Tcherta and Plenka keymaps include this module directly. Keep this module
on `main` when switching keyboards. See the workspace's `WORKSPACE.md` for
keyboard branches, build commands, and local setup.

## Current Thumb Binding

The left language-change thumb key taps `F20` and holds the right mouse button.
The physical shield must enable `CONFIG_ZMK_POINTING=y`; Bluetooth hosts need to
be re-paired after that option is first enabled because the HID descriptor gains
mouse support.

## Suggested Structure

- `boards/shields/common/` for shared keymap/layout dtsi includes
- `dts/` for reusable snippets/macros
- `snippets/` for optional feature bundles
