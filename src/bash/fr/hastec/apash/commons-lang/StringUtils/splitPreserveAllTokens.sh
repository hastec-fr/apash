#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.splitPreserveAllTokens
# @brief Splits the provided text into an array preserving all tokens.
# @description Splits the provided text into an array.eparators specified, 
# preserving all tokens, including empty tokens created by adjacent separators.
# The separator is not included in the returned String array. 
# Adjacent separators are treated as separators for empty tokens
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
#    StringUtils.splitPreserveAllTokens myArray ""  ""                    # []
#    StringUtils.splitPreserveAllTokens myArray ""  ":"                   # []
#    StringUtils.splitPreserveAllTokens myArray "ab:cd:ef" ""             # ["ab:cd:ef"]
#    StringUtils.splitPreserveAllTokens myArray "::ab::cd:ef::" ":"       # ["", "", "ab", "", "cd", "ef", ""]
#    StringUtils.splitPreserveAllTokens myArray $'ab\n\ncd\nef' $'\n'     # ["ab", "", "cd", "ef"]
#    StringUtils.splitPreserveAllTokens myArray "abab::cd:ab:ef::ab" "ab" # ["", "", "::cd:", ":ef::", ""]
#
# @arg $1 string[] The result array which will contains tokens.
# @arg $2 string The string to split.
# @arg $3 string The delimiter (can be a sequance of characters).
#
# @stdout None
# @stderr None
#
# @warning: Not optimized, but looks functional. 
# @exitcode 0 When result array exists.
# @exitcode 1 When input array does not exists.
StringUtils.splitPreserveAllTokens() {
  local -n inArray="$1" || return "$APASH_FUNCTION_FAILURE"
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
      i=$((i + ${#inDelimiter}-1))

      # If delimiter is at the end, then add an empty token
      [[ i -eq $((${#inString}-1)) ]] && inArray+=("")
      continue
    fi
    currentString+=${inString:$i:1}
  done
  [ -n "$currentString" ] && inArray+=("$currentString")
  return "$APASH_FUNCTION_SUCCESS"
}

