#!/usr/bin/env bash

# @file equals.sh
# @brief Compares two string, returning true if they represent equal sequences of characters.
# @example
#    if StringUtils.equals "" ""       ; then echo "true"; else echo "false"; # return true
#    if StringUtils.equals "abc" "abc" ; then echo "true"; else echo "false"; # return true
#    if StringUtils.equals "abc" "abcd"; then echo "true"; else echo "false"; # return false
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

# Functions ########################################
StringUtils.equals() {
  [ "$1" == "$2" ] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
