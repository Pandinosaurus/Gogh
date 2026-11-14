#!/usr/bin/env bash

export PROFILE_NAME="Stranger Theme Starcourt"

export COLOR_01="#424256"           # Black (Host)
export COLOR_02="#FF6B6B"           # Red (Syntax string)
export COLOR_03="#00FA9A"           # Green (Command)
export COLOR_04="#FFD700"           # Yellow (Command second)
export COLOR_05="#BA55D3"           # Blue (Path)
export COLOR_06="#FF1493"           # Magenta (Syntax var)
export COLOR_07="#00CED1"           # Cyan (Prompt)
export COLOR_08="#EAEAEA"           # White

export COLOR_09="#8C77C3"           # Bright Black
export COLOR_10="#FF8989"           # Bright Red (Command error)
export COLOR_11="#1EFFB8"           # Bright Green (Exec)
export COLOR_12="#FFF51E"           # Bright Yellow
export COLOR_13="#D873F1"           # Bright Blue (Folder)
export COLOR_14="#FF32B1"           # Bright Magenta
export COLOR_15="#1EECEF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1A1A2E"   # Background
export FOREGROUND_COLOR="#EAEAEA"   # Foreground (Text)

export CURSOR_COLOR="#EAEAEA" # Cursor

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
