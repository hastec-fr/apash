#!/usr/bin/env bash

# @file isBlank.sh
# @description Checks if a string contains only whitespaces characters or is empty or not existing.
# @example
#    if StringUtils.isBlank ""           ; then echo "true"; else echo "false"; # return true
#    if StringUtils.isBlank "     "      ; then echo "true"; else echo "false"; # return true
#    if StringUtils.isBlank "Hello World"; then echo "true"; else echo "false"; # return false
#
# @arg $1 string The string to check.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
#
# @see [StringUtils](../StringUtils.md)

# Dependencies #####################################
import fr.hastec.apash.commons-lang.StringUtils.trim

# Functions ########################################
StringUtils.isBlank() {
  local inString="$1"
  local trimmedString  
  trimmedString=$(StringUtils.trim "$inString")
  [ -z "$trimmedString" ] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}