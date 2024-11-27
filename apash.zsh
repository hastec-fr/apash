#!/usr/bin/env zsh

##############################################################################
# @name apash.zsh
# @brief Wrapper to execute the main script with zsh interpreter
# @description
#   apash is the entry point for executing action related to
#   Source the main script to avoid its shebang.
#
. "$APASH_HOME_DIR/apash.bash" "$@"
