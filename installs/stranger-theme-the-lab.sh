#!/usr/bin/env bash

export PROFILE_NAME="Stranger Theme The Lab"

export COLOR_01="#42454E"           # Black (Host)
export COLOR_02="#FF4136"           # Red (Syntax string)
export COLOR_03="#2ECC40"           # Green (Command)
export COLOR_04="#FFDC00"           # Yellow (Command second)
export COLOR_05="#7FDBFF"           # Blue (Path)
export COLOR_06="#B10DC9"           # Magenta (Syntax var)
export COLOR_07="#39CCCC"           # Cyan (Prompt)
export COLOR_08="#E0E5EC"           # White

export COLOR_09="#73879C"           # Bright Black
export COLOR_10="#FF5F54"           # Bright Red (Command error)
export COLOR_11="#4CEA5E"           # Bright Green (Exec)
export COLOR_12="#FFFA1E"           # Bright Yellow
export COLOR_13="#9DF9FF"           # Bright Blue (Folder)
export COLOR_14="#CF2BE7"           # Bright Magenta
export COLOR_15="#57EAEA"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1A1D26"   # Background
export FOREGROUND_COLOR="#E0E5EC"   # Foreground (Text)

export CURSOR_COLOR="#E0E5EC" # Cursor

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
