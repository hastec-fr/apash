#!/usr/bin/env bash

# @description Compares two CharSequences, returning true if they represent equal sequences of characters.
# @example
#    if StringUtils.equals "" ""       ; then echo "true"; else echo "false"; # return true
#    if StringUtils.equals "abc" "abc" ; then echo "true"; else echo "false"; # return true
#    if StringUtils.equals "abc" "abcd"; then echo "true"; else echo "false"; # return false
#
# @arg $1 string First input string to compare
# @arg $2 string Second input string to compare
#
# @stdout None
# @stderr None
#
# @exitcode 0 If the CharSequences are equal (case-sensitive), or both empty
# @exitcode 1 Otherwise
StringUtils.equals() {
  [ "$1" == "$2" ] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
