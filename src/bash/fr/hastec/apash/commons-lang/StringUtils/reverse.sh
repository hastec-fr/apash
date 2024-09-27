#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.BashUtils.isCommandValid

# File description ###########################################################
# @name StringUtils.reverse
# @brief Reverses a string.
# @description 
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
#    StringUtils.reverse             # ""
#    StringUtils.reverse ""          # ""
#    StringUtils.reverse "bat"       # "tab"
#    StringUtils.reverse "bat man"   # "nam tab"
#
# @arg $1 string The string to reverse.
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
    echo "WARNING - Degraded mode (rev command not found)" >&2
    # Loop through the string in reverse order
    for (( i=${#inString}-1; i>=0; i-- )); do
        reversed_string="$reversed_string${inString:$i:1}"
    done
    echo "$reversed_string" && return "$APASH_FUNCTION_SUCCESS"
  fi

  return "$APASH_FUNCTION_FAILURE"
}

