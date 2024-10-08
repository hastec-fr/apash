#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty

# File description ###########################################################
# @name StringUtils.split
# @brief Splits the provided text into an array.
# @description 
#   Non array reference will be transformed to empty array.
#   Splits the provided text into an array. Default separator is " "
#   The separator is not included in the returned String array.
#   Adjacent separators are treated as one separator. Leading and tailing separators
#   are not considered.
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
#    StringUtils.split myArray ""  ""                    # []
#    StringUtils.split myArray ""  ":"                   # []
#    StringUtils.split myArray "ab:cd:ef" ""             # ["ab:cd:ef"]
#    StringUtils.split myArray "::ab::cd:::ef::" ":"     # ["ab", "cd", "ef"]
#    StringUtils.split myArray $'ab\n\ncd\nef' $'\n'     # ["ab", "cd", "ef"]
#    StringUtils.split myArray "abab::cd:ab:ef::ab" "ab" # ["::cd:", ":ef::"]
#
# @arg $1 string[] The result array which will contains tokens.
# @arg $2 string The string to split.
# @arg $3 string The delimiter (can be a sequance of characters).
#
# @stdout None.
# @stderr None
#
# @warning: Not optimized, but looks functional.
# @exitcode 0 When result array exists.
# @exitcode 1 When input array does not exists.
StringUtils.split() {
  local inArrayName="$1"
  ArrayUtils.nullToEmpty  "$inArrayName" || return "$APASH_FUNCTION_FAILURE"

  local -n inArray="$inArrayName"
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

