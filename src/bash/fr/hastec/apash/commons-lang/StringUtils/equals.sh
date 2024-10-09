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
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inString1      | string        | in       |            | First string to compare.              |
# | $2     | inString2      | string        | in       |            | Second string to compare.             |
#
# @example
#    StringUtils.equals "" ""        # true
#    StringUtils.equals "abc" "abc"  # true
#    StringUtils.equals "abc" "abcd" # false
#
# @stdout None.
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
