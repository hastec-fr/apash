#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.isAnyEmpty
# @brief Checks if one of the input string is empty ("").
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
# @arg $1 string... Input strings to evaluate
#
# @stdout None
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
