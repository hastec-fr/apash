#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.BashUtils.isCommandValid

# File description ###########################################################
# @name StringUtils.reverse
# @brief Reverses a string.
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
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inString       | string        | in       |            | The string to reverse.                |
#
# @example
#    StringUtils.reverse             # ""
#    StringUtils.reverse ""          # ""
#    StringUtils.reverse "bat"       # "tab"
#    StringUtils.reverse "bat man"   # "nam tab"
#
# @stdout The reversed string.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
StringUtils.reverse() {
  local inString="$1"
  local i

  if BashUtils.isCommandValid "rev"; then
    echo "$inString" | rev && return "$APASH_FUNCTION_SUCCESS"
  else
    # @WARNING: Degraded mode (rev command not found)
    # Loop through the string in reverse order
    for (( i=${#inString}-1; i>=0; i-- )); do
        reversed_string="$reversed_string${inString:$i:1}"
    done
    echo "$reversed_string" && return "$APASH_FUNCTION_SUCCESS"
  fi

  return "$APASH_FUNCTION_FAILURE"
}

