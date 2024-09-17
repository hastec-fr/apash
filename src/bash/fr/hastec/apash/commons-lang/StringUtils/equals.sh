#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.equals
# @brief Compares two string, returning true if they represent equal sequences of characters.
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
#    StringUtils.equals "" ""        # true
#    StringUtils.equals "abc" "abc"  # true
#    StringUtils.equals "abc" "abcd" # false
#
# @arg $1 string First string to compare.
# @arg $2 string Second string to compare.
#
# @stdout None
# @stderr None
#
# @exitcode 0 If the string are equal (case-sensitive), or both empty.
# @exitcode 1 Otherwise.
#
# @see [StringUtils](../StringUtils.md)
StringUtils.equals() {
  [ "$1" == "$2" ] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
