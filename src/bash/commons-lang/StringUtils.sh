#!/usr/bin/env bash

FUNCTION_SUCCESS=0
FUNCTION_FAILURE=1

# @file StringUtils.sh
# @brief Operations on String considering null as empty string
# @description
#     This implementation do reference to the [java apache implementation](http://commons.apache.org/proper/commons-lang/javadocs/api-3.1/org/apache/commons/lang3/StringUtils.html)
# @see [Javadoc - StringUtils].

# @description Checks if a CharSequence is empty ("") or not existing.
# @example
#    if StringUtils.isEmpty ""           ; then echo "true"; else echo "false"; # return true
#    if StringUtils.isEmpty "     "      ; then echo "true"; else echo "false"; # return false
#    if StringUtils.isEmpty "Hello World"; then echo "true"; else echo "false"; # return false
#
# @arg $1 string Input string to evaluate
#
# @stdout No output
# @stderr None
#
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
StringUtils.isEmpty() {
  local inString="$1"
  [ -z "$inString" ] && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}


# @description Checks if a CharSequence contains only whitespaces caracters or is empty or not existing.
# @example
#    if StringUtils.isBlank ""           ; then echo "true"; else echo "false"; # return true
#    if StringUtils.isBlank "     "      ; then echo "true"; else echo "false"; # return true
#    if StringUtils.isBlank "Hello World"; then echo "true"; else echo "false"; # return false
#
# @arg $1 string Input string to evaluate
#
# @stdout No output
# @stderr None
#
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
StringUtils.isBlank() {
  local inString="$1"
  local trimString  
  trimString=$(StringUtils.trim "$inString")
  [ -z "$trimString" ] && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}



StringUtils.trim() {
  local inString="$1"
  local trimString=""

  trimString="$(echo "$inString" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  echo "$trimString" && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}
