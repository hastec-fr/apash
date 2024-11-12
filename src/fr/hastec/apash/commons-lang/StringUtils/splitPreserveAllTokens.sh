#!/usr/bin/env bash

apash.import "fr.hastec.apash.commons-lang.ArrayUtils.clone"

# File description ###########################################################
# @name StringUtils.splitPreserveAllTokens
# @brief Splits the provided text into an array preserving all tokens.
# @description 
#   Splits the provided text into an array.eparators specified, 
#   preserving all tokens, including empty tokens created by adjacent separators.
#   The separator is not included in the returned String array. 
#   Adjacent separators are treated as separators for empty tokens
#
# ### Since:
# 0.1.0
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
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | outArrayName    | string[]      | out      |            | The result array which will contains tokens.     |
# | $2     | inString       | string        | in       |            | The string to split.                             |
# | $3     | inDelimiter    | string        | in       | " "        | The delimiter (can be a sequance of characters). |
#
# @example
#    StringUtils.splitPreserveAllTokens myArray ""  ""                    # []
#    StringUtils.splitPreserveAllTokens myArray ""  ":"                   # []
#    StringUtils.splitPreserveAllTokens myArray "ab:cd:ef" ""             # ["ab:cd:ef"]
#    StringUtils.splitPreserveAllTokens myArray "::ab::cd:ef::" ":"       # ["", "", "ab", "", "cd", "ef", ""]
#    StringUtils.splitPreserveAllTokens myArray $'ab\n\ncd\nef' $'\n'     # ["ab", "", "cd", "ef"]
#    StringUtils.splitPreserveAllTokens myArray "abab::cd:ab:ef::ab" "ab" # ["", "", "::cd:", ":ef::", ""]
#
# @stdout None.
# @stderr None.
#
# @WARNING: Not optimized, but looks functional.
#
# @exitcode 0 When result array exists.
# @exitcode 1 When input array does not exists.
StringUtils.splitPreserveAllTokens() {
  local ioArrayName="$1"  
  local inString="$2"
  local inDelimiter="${3:- }"
  local currentString=""
  local outArray=()

  # Loop on each char
  for (( i=0; i<${#inString}; i++ )); do
    # Check if the next chars correspond to delimiter
    if [[ ${inString:$i:${#inDelimiter}} = "$inDelimiter" ]]; then
      outArray+=("$currentString")
      currentString=""
      i=$((i + ${#inDelimiter}-1))

      # If delimiter is at the end, then add an empty token
      [[ i -eq $((${#inString}-1)) ]] && outArray+=("")
      continue
    fi
    currentString+=${inString:$i:1}
  done
  [ -n "$currentString" ] && outArray+=("$currentString")

  ArrayUtils.clone "outArray" "$ioArrayName"

  return "$APASH_FUNCTION_SUCCESS"
}

