#!/usr/bin/env ksh

##############################################################################
# @name apash.ksh
# @brief Wrapper to execute the main script with ksh interpreter
# @description
#   apash is the entry point for executing action related to
#   Source the main script to avoid its shebang.
#
alias local="typeset"
. "$APASH_HOME_DIR/apash.bash" "$@"
