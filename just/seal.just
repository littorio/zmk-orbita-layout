# Build shield with prompted passwords using shared orbita helper script.
seal expr:
    #!/usr/bin/env bash
    set -euo pipefail

    shield="{{ expr }}"
    if [[ -z "$shield" ]]; then
        echo "Usage: just seal <shield>" >&2
        exit 1
    fi

    keyboard_module="${KEYBOARD_MODULE:-modules/zmk/zmk-keyboard-tcherta}"
    module_dir="{{ justfile_directory() }}/${keyboard_module}"
    shield_dir="${module_dir}/boards/shields/${shield}"
    private_dtsi="${shield_dir}/DELETE_ME_orbita-password.dtsi"

    script="${SEAL_SCRIPT:-{{ justfile_directory() }}/modules/zmk/zmk-orbita-layout/scripts/orbita_build_with_passwords.sh}"

    if [[ ! -x "$script" ]]; then
        echo "Missing executable script: $script" >&2
        echo "Set SEAL_SCRIPT to override script location." >&2
        exit 1
    fi

    if [[ ! -f "${shield_dir}/${shield}.keymap" ]]; then
        echo "Shield keymap not found: ${shield_dir}/${shield}.keymap" >&2
        echo "Check out the matching keyboard-module branch; see WORKSPACE.md." >&2
        echo "Set KEYBOARD_MODULE if shield files are stored in a different module path." >&2
        exit 1
    fi

    # Keep local secret-file rules outside branch-specific tracked metadata.
    exclude_file=$(git -C "$module_dir" rev-parse --path-format=absolute --git-path info/exclude)
    ignore_rule='boards/shields/*/DELETE_ME_orbita-password.dtsi'
    mkdir -p "$(dirname "$exclude_file")"
    if [[ ! -f "$exclude_file" ]] || ! grep -qxF "$ignore_rule" "$exclude_file"; then
        printf '\n%s\n' "$ignore_rule" >> "$exclude_file"
    fi

    ZMK_WORKSPACE="{{ justfile_directory() }}" \
    SHIELD="$shield" \
    PRIVATE_DTSI="$private_dtsi" \
    "$script"
