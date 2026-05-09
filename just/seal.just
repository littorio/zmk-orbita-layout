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
    shield_dir="{{ justfile_directory() }}/${keyboard_module}/boards/shields/${shield}"
    private_dtsi="${shield_dir}/DELETE_ME_orbita-password.dtsi"

    script="${SEAL_SCRIPT:-{{ justfile_directory() }}/modules/zmk/zmk-orbita-layout/scripts/orbita_build_with_passwords.sh}"

    if [[ ! -x "$script" ]]; then
        echo "Missing executable script: $script" >&2
        echo "Set SEAL_SCRIPT to override script location." >&2
        exit 1
    fi

    if [[ ! -d "$shield_dir" ]]; then
        echo "Shield directory not found: $shield_dir" >&2
        echo "Set KEYBOARD_MODULE if shield files are stored in a different module path." >&2
        exit 1
    fi

    ZMK_WORKSPACE="{{ justfile_directory() }}" \
    SHIELD="$shield" \
    PRIVATE_DTSI="$private_dtsi" \
    "$script"
