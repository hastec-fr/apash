#!/usr/bin/env bash

# @name StringUtils.endsWith
# @brief Check if a string ends with a specified suffix.
# @example
#    if StringUtils.endsWith "" ""        ; then echo "true"; else echo "false"; # true
#    if StringUtils.endsWith "abcd" ""    ; then echo "true"; else echo "false"; # true
#    if StringUtils.endsWith "abcd" "cd"  ; then echo "true"; else echo "false"; # true
#    if StringUtils.endsWith "abcd" "bd"  ; then echo "true"; else echo "false"; # false
#    if StringUtils.endsWith ""     "c"   ; then echo "true"; else echo "false"; # false
#
# @arg $1 string Input string to check.
# @arg $2 string The suffix to find.
#
# @stdout None
# @stderr None
#
# @exitcode 0 If the string ends with the suffix.
# @exitcode 1 Otherwise.
#
# @see [StringUtils](../StringUtils.md)
StringUtils.endsWith(){
  local inString=$1
  local inSuffix=$2

  [[ $inString =~ $inSuffix$ ]] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}