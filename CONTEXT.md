# Project Context: zmk-orbita-layout

Purpose: shared ZMK layout module used by Tcherta and Plenka, so logical layout
changes are made once. Keyboard branch selection and workspace build workflows
are documented in the workspace's `WORKSPACE.md`.

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

The module is a remote-tracked West project at
`modules/zmk/zmk-orbita-layout`.
