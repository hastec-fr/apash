#!/usr/bin/env bash

# @description Check if a CharSequence ends with a specified suffix.
# @example
#    if StringUtils.endsWith "" ""        ; then echo "true"; else echo "false"; # return true
#    if StringUtils.endsWith "abcd" ""    ; then echo "true"; else echo "false"; # return true
#    if StringUtils.endsWith "abcd" "cd"  ; then echo "true"; else echo "false"; # return true
#    if StringUtils.endsWith "abcd" "bd"  ; then echo "true"; else echo "false"; # return false
#    if StringUtils.endsWith ""     "c"   ; then echo "true"; else echo "false"; # return false
#
# @arg $1 string Input string to check
# @arg $2 the suffix to find
#
# @stdout None
# @stderr None
#
# @exitcode 0 If the string ends with the suffix
# @exitcode 1 Otherwise.
StringUtils.endsWith(){
  local inString=$1
  local inSuffix=$2

  [[ $inString =~ $inSuffix$ ]] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}