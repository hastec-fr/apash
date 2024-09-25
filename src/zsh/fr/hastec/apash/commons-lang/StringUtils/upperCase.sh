#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.upperCase
# @brief Converts a String to upper case.
# @description 
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
# @example
#    StringUtils.upperCase ""              # ""
#    StringUtils.upperCase "abc"           # "ABC"
#    StringUtils.upperCase "aBc"           # "ABC"
#    StringUtils.upperCase "a123b"         # "A123B"
#    StringUtils.upperCase "ABC"           # "ABC"
#    StringUtils.upperCase "crème brûlée"  # "CRÈME BRÛLÉE"
#
# @arg $1 string The string to upper case
#
# @stdout The upper cased string
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
StringUtils.upperCase() {
  local inString="$1"

  echo "${inString^^}" && return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}

