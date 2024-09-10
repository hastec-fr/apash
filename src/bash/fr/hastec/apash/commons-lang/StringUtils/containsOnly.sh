#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.containsOnly
# @brief Checks if the CharSequence contains only certain characters.
# @description Checks if the CharSequence contains only certain characters.
# An empty input string returns always true.
# An empty sequence of character to search with a non empty input 
# string returns false.
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
#    if StringUtils.constainsOnly ""     ""    ; then echo "true"; else echo "false"; # true
#    if StringUtils.constainsOnly ""     "ab"  ; then echo "true"; else echo "false"; # true
#    if StringUtils.constainsOnly "ab"   ""    ; then echo "true"; else echo "false"; # false
#    if StringUtils.constainsOnly "abab" "abc" ; then echo "true"; else echo "false"; # true
#    if StringUtils.constainsOnly "ab1"  "abc" ; then echo "true"; else echo "false"; # false
#    if StringUtils.constainsOnly "abz"  "abc" ; then echo "true"; else echo "false"; # false
# 
# @arg $1 string The string to check.
# @arg $2 string The sequence of characters which should compose the input string.
#
# @stdout None
# @stderr None
#
# @exitcode 0 True if the input string contains only provided characters.
# @exitcode 1 Otherwise.
#
StringUtils.containsOnly(){
  local inString=$1
  local inSequence=$2

  # Fail when input string is not empty but sequence is.
  [[ -n $inString && -z $inSequence ]] && return "$APASH_FUNCTION_FAILURE"

  # Check by regexp that string is composed only by chars in the sequence.
  [[ $inString =~ ^[$inSequence]*$ ]] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
