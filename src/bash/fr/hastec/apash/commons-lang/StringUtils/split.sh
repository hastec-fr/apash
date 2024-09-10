#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.split
# @brief Splits the provided text into an array.
# @description Splits the provided text into an array. Default separator is " "
# The separator is not included in the returned String array.
# Adjacent separators are treated as one separator. Leading and tailing separators
# are not considered.
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
#    if StringUtils.isBlank ""           ; then echo "true"; else echo "false"; # true
#    if StringUtils.isBlank "     "      ; then echo "true"; else echo "false"; # true
#    if StringUtils.isBlank "Hello World"; then echo "true"; else echo "false"; # false
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
  local -n inArray="$1" || return "$APASH_FUNCTION_FAILURE"
  local inString="$2"
  local inDelimiter="${3:- }"
  local currentString=""
  inArray=()

  # Remove starting delimiters
  inString=${inString##+("$inDelimiter")}

  # Remove tailing delimiters
  inString=${inString%%+("$inDelimiter")}

  # Loop on each char
  for (( i=0; i<${#inString}; i++ )); do
    # Check if the next chars correspond to delimiter
    if [[ ${inString:$i:${#inDelimiter}} = "$inDelimiter" ]]; then
      inArray+=("$currentString")
      currentString=""
      while [[ ${inString:$i:${#inDelimiter}} = "$inDelimiter" ]]; do
        # Skip the number of chars corresponding to the delimiter.
        i=$((i + ${#inDelimiter}))
      done
      # Compense the last increment realize by for loop
      i=$((i - 1))
      continue
    fi
    currentString+=${inString:$i:1}
  done
  [ -n "$currentString" ] && inArray+=("$currentString")
  return "$APASH_FUNCTION_SUCCESS"
}