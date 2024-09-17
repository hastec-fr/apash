#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.trim
# @brief Remove whitespaces characters from both ends of the input string.
# @description <!-- -->
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
#    StringUtils.trim ""                 # ""
#    StringUtils.trim "     "            # ""
#    StringUtils.trim "  Hello  World  " # "Hello  World"
#
# @arg $1 string Input string to trim.
#
# @stdout the trimmed string
# @stderr None
#
# @exitcode 0 If the string can be displayed.
# @exitcode 1 Otherwise.
StringUtils.trim() {
  local inString="$1"
  local trimmedString=""

  trimmedString="$(echo "$inString" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  echo "$trimmedString" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}