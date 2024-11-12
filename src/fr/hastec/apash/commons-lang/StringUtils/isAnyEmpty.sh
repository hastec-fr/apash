#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.isAnyEmpty
# @brief Checks if one of the input string is empty ("").
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
# | ${@:1} | inStrings      | string...     | in       |            | The strings to check.                 |
#
# @example
#    StringUtils.isAnyEmpty                  # true
#    StringUtils.isAnyEmpty ""               # true
#    StringUtils.isAnyEmpty "     "          # false
#    StringUtils.isAnyEmpty "Hello"          # false
#    StringUtils.isAnyEmpty ""        "foo"  # true
#    StringUtils.isAnyEmpty "bob"     ""     # true
#    StringUtils.isAnyEmpty "  bob  " ""     # true
#    StringUtils.isAnyEmpty " "       "bar"  # false
#    StringUtils.isAnyEmpty "foo"     "bar"  # false
#
# @stdout None.
# @stderr None
#
# @exitcode 0 If at least one element is empty, or no element provided.
# @exitcode 1 If all arguments are not empty.
StringUtils.isAnyEmpty() {
  # Return succes if no argument
  [ $# -eq 0 ] &&  return "$APASH_FUNCTION_SUCCESS"

  # For each argument, determine if it's an array and if an element is empty
  for s in "$@"; do
    [[ -z $s ]] && return "$APASH_FUNCTION_SUCCESS"
  done
  return "$APASH_FUNCTION_FAILURE"
}
