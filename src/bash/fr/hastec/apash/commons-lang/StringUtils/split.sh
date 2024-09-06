#!/usr/bin/env bash

# @description Splits the provided text into an array, using space as default separator.
# The separator is not included in the returned String array. 
# Adjacent separators are NOT treated as one separator.
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
# @warning: Not optimized, but looks functional. 
#           Take care of the difference with JAVA doc about adjacent separator.
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
StringUtils.split() {
  local -n inArray="$1" || return $APASH_FUNCTION_FAILURE
  local inString="$2"
  local inDelimiter="${3:- }"
  local currentString=""
  inArray=()

  # Loop on each char
  for (( i=0; i<${#inString}; i++ )); do
    # Check if the next chars correspond to delimiter
    if [[ ${inString:$i:${#inDelimiter}} = "$inDelimiter" ]]; then
      inArray+=("$currentString")
      currentString=""
      # Skip the number of chars corresponding to the delimiter.
      i=$((i + ${#inDelimiter} - 1))
      continue
    fi
    currentString+=${inString:$i:1}
  done
  [ -n "$currentString" ] && inArray+=("$currentString")
  return $APASH_FUNCTION_SUCCESS
}