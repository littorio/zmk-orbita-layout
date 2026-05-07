# zmk-orbita-layout

Shared logical layout module for Orbita keyboards.

## Purpose

Keep common keymap/layout logic in one place and let keyboard-specific modules
(such as `tcherta` and `plenka`) include and extend it.

## Local Development

This module is intended to be used from local sources in the workspace under:

- `modules/zmk/orbita-layout`

No GitHub push is required for local build/testing.

## Suggested Structure

- `boards/shields/common/` for shared keymap/layout dtsi includes
- `dts/` for reusable snippets/macros
- `snippets/` for optional feature bundles
