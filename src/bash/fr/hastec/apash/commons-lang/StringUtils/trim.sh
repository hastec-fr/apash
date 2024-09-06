#!/usr/bin/env bash

# @description Remove whitespaces characters from both ends of the input string.
# @example
#    StringUtils.trim ""                 # return ""
#    StringUtils.trim "     "            # return ""
#    StringUtils.trim "  Hello  World  " # return "Hello  World"
#
# @arg $1 string Input string to trim.
#
# @stdout the trimmed string
# @stderr None
#
# @exitcode 0 If the string can be displayed.
# @exitcode 1 Otherwise.
StringUtils.trim() {
  local inString="$1"
  local trimmedString=""

  trimmedString="$(echo "$inString" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  echo "$trimmedString" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}