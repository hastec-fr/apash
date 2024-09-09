#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.isEmpty
# @brief Checks if a string is empty ("") or not existing.
# @description <!-- -->
# ### Authors:
# * Benjamin VARGIN

# Method description #########################################################
# @description
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
# <!-- apash.parentEnd -->
#
# @example
#    if StringUtils.isEmpty ""           ; then echo "true"; else echo "false"; # true
#    if StringUtils.isEmpty "     "      ; then echo "true"; else echo "false"; # false
#    if StringUtils.isEmpty "Hello World"; then echo "true"; else echo "false"; # false
#
# @arg $1 string Input string to evaluate
#
# @stdout None
# @stderr None
#
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
StringUtils.isEmpty() {
  [ -z "$1" ] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
