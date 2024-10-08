#!/usr/bin/env bash

# File description ###########################################################
# @name BashUtils.isCommandValid
# @brief Defensive programming technique to check that a variable name is valid
#
# @description
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Example
# ```bash
#    BashUtils.isCommandValid  ""                # false
#    BashUtils.isCommandValid  "apashnotexist"   # false
#    BashUtils.isCommandValid  "command"         # true
# ```
#
# @arg $1 string Command to analyse
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the command name is correct.
# @exitcode 1 Otherwise.
BashUtils.isCommandValid() {
  local commandName="$1"
  command -v "$commandName" >/dev/null 2>&1 && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
