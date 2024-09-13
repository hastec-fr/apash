#!/usr/bin/env bash

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

  echo "$inString" | rev && return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}

