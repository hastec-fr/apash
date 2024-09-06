#!/usr/bin/env bash

# @description Check if a CharSequence starts with a specified prefix.
# @example
#    if StringUtils.startsWith "" ""        ; then echo "true"; else echo "false"; # return true
#    if StringUtils.startsWith "abcd" ""    ; then echo "true"; else echo "false"; # return true
#    if StringUtils.startsWith "abcd" "ab"  ; then echo "true"; else echo "false"; # return true
#    if StringUtils.startsWith "abcd" "abd" ; then echo "true"; else echo "false"; # return false
#    if StringUtils.startsWith ""     "a"   ; then echo "true"; else echo "false"; # return false
#
# @arg $1 string Input string to check
# @arg $2 the prefix to find
#
# @stdout None
# @stderr None
#
# @exitcode 0 If the string starts with the prefix
# @exitcode 1 Otherwise.
StringUtils.startsWith(){
  local inString=$1
  local inPrefix=$2

  [[ $inString =~ ^$inPrefix ]] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}