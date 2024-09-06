#!/usr/bin/env bash

# @description Checks if the CharSequence contains only certain characters.
# A null CharSequence will return false. A null valid character array will return false. An empty CharSequence (length()=0) always returns true.
# @example
#    if StringUtils.constainsOnly "" ""        ; then echo "true"; else echo "false"; # return true
#    if StringUtils.constainsOnly "ab" ""      ; then echo "true"; else echo "false"; # return false
#    if StringUtils.constainsOnly "abab" "abc" ; then echo "true"; else echo "false"; # return true
#    if StringUtils.constainsOnly "ab1"  "abc" ; then echo "true"; else echo "false"; # return false
#    if StringUtils.constainsOnly "abz"  "abc" ; then echo "true"; else echo "false"; # return false
#
# @arg $1 string Input string to check
# @arg $2 the list of characters which should compose the input string
#
# @stdout None
# @stderr None
#
# @exitcode 0 true if the input string contains only provided characters.
# @exitcode 1 Otherwise.
StringUtils.containsOnly(){
  set -x
  local inString=$1
  local inChars=$2

  [[ -n $inString && -z $inChars ]] && return "$APASH_FUNCTION_FAILURE"

  [[ $inString =~ ^[$inChars]*$ ]] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
