#!/usr/bin/env bash

import fr.hastec.apash.commons-lang.StringUtils.trim

# @description Checks if a CharSequence contains only whitespaces caracters or is empty or not existing.
# @example
#    if StringUtils.isBlank ""           ; then echo "true"; else echo "false"; # return true
#    if StringUtils.isBlank "     "      ; then echo "true"; else echo "false"; # return true
#    if StringUtils.isBlank "Hello World"; then echo "true"; else echo "false"; # return false
#
# @arg $1 string Input string to evaluate
#
# @stdout None
# @stderr None
#
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
StringUtils.isBlank() {
  local inString="$1"
  local trimmedString  
  trimmedString=$(StringUtils.trim "$inString")
  [ -z "$trimmedString" ] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}