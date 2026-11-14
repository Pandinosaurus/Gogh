#!/usr/bin/env bash

export PROFILE_NAME="Stranger Theme Dimension X"

export COLOR_01="#464242"           # Black (Host)
export COLOR_02="#FF6B6B"           # Red (Syntax string)
export COLOR_03="#8FAE7E"           # Green (Command)
export COLOR_04="#D19A66"           # Yellow (Command second)
export COLOR_05="#C678DD"           # Blue (Path)
export COLOR_06="#FF55AA"           # Magenta (Syntax var)
export COLOR_07="#7FB5B0"           # Cyan (Prompt)
export COLOR_08="#E8D5D5"           # White

export COLOR_09="#9A7C7C"           # Bright Black
export COLOR_10="#FF8989"           # Bright Red (Command error)
export COLOR_11="#ADCC9C"           # Bright Green (Exec)
export COLOR_12="#EFB884"           # Bright Yellow
export COLOR_13="#E496FB"           # Bright Blue (Folder)
export COLOR_14="#FF73C8"           # Bright Magenta
export COLOR_15="#9DD3CE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1E1A1A"   # Background
export FOREGROUND_COLOR="#E8D5D5"   # Foreground (Text)

export CURSOR_COLOR="#E8D5D5" # Cursor

apply_theme() {
    if [[ -e "${GOGH_APPLY_SCRIPT}" ]]; then
      bash "${GOGH_APPLY_SCRIPT}"
    elif [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
      bash "${PARENT_PATH}/apply-colors.sh"
    elif [[ -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
      bash "${SCRIPT_PATH}/apply-colors.sh"
    else
      printf '\n%s\n' "Error: Couldn't find apply-colors.sh" 1>&2
      exit 1
    fi
}

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

if [ -z "${GOGH_NONINTERACTIVE+no}" ]; then
    apply_theme
else
    apply_theme 1>/dev/null
fi
