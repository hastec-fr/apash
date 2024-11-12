#!/usr/bin/env bash

# File description ###########################################################
# @name BashUtils.isCommandValid
# @brief Defensive programming technique to check that a variable name is valid
# @description
#
# ### Since:
# 0.1.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | commandName    | string        | in       |            | Command to analyse                    |
#
# #### Example
# ```bash
#    BashUtils.isCommandValid  ""                # false
#    BashUtils.isCommandValid  "apashnotexist"   # false
#    BashUtils.isCommandValid  "command"         # true
# ```
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
