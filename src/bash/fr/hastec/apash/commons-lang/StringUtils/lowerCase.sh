#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.lowerCase
# @brief Converts a String to lower case.
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
#    StringUtils.upperCase "ABC"           # "abc"
#    StringUtils.upperCase "AbC"           # "abc"
#    StringUtils.upperCase "A123B"         # "a123b"
#    StringUtils.upperCase "abc"           # "abc"
#    StringUtils.upperCase "CRÈME BRÛLÉE"  # "crème brûlée"
#
# @arg $1 string The string to lower case
#
# @stdout The lower cased string
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
StringUtils.lowerCase() {
  local inString="$1"

  echo "${inString,,}" && return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}

