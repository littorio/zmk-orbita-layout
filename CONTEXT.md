# Project Context: zmk-orbita-layout

Purpose: shared ZMK layout module used by multiple keyboards (for example
`tcherta` and `plenka`) so logical layout changes are made once.

## Scope

- shared layer definitions
- shared combos/behaviors/macros
- optional shared snippets for feature flags

## Non-Goals

- board wiring/pins
- shield-specific hardware overlays
- per-board device quirks

## Integration Pattern

Keyboard modules should include shared layout files from this module while
keeping board-specific wiring and optional hardware features local.
