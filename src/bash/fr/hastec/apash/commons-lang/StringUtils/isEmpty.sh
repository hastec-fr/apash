#!/usr/bin/env bash

# @name StringUtils.isEmpty
# @brief Checks if a string is empty ("") or not existing.
# @example
#    if StringUtils.isEmpty ""           ; then echo "true"; else echo "false"; # true
#    if StringUtils.isEmpty "     "      ; then echo "true"; else echo "false"; # false
#    if StringUtils.isEmpty "Hello World"; then echo "true"; else echo "false"; # false
#
# @arg $1 string Input string to evaluate
#
# @stdout None
# @stderr None
#
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
StringUtils.isEmpty() {
  [ -z "$1" ] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
