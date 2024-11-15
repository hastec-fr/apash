#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name StringUtils.split
# @brief Splits the provided text into an array.
# @description 
#   Non array reference will be transformed to empty array.
#   Splits the provided text into an array. Default separator is " "
#   The separator is not included in the returned String array.
#   Adjacent separators are treated as one separator. Leading and tailing separators
#   are not considered.<br/>
#   @todo: Optimize this function.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | outArrayName   | string[]      | out      |            | The result array which will contains tokens.     |
# | $2     | inString       | string        | in       |            | The string to split.                             |
# | $3     | inDelimiter    | string        | in       | " "        | The delimiter (can be a sequence of characters). |
#
# #### Example
# ```bash
#    StringUtils.split myArray ""  ""                    # []
#    StringUtils.split myArray ""  ":"                   # []
#    StringUtils.split myArray "ab:cd:ef" ""             # ["ab:cd:ef"]
#    StringUtils.split myArray "::ab::cd:::ef::" ":"     # ["ab", "cd", "ef"]
#    StringUtils.split myArray $'ab\n\ncd\nef' $'\n'     # ["ab", "cd", "ef"]
#    StringUtils.split myArray "abab::cd:ab:ef::ab" "ab" # ["::cd:", ":ef::"]
# ```
#
# @stdout None.
# @stderr None.
# 
# @exitcode 0 When result array exists.
# @exitcode 1 When input array does not exists.
#/
StringUtils.split() {
  Log.entry "$LINENO" "$@"
  local inArrayName="$1"
  local inString="$2"
  local inDelimiter="${3:- }"
  local currentString=""
  local i
  local outArray=()

  # Remove starting delimiters
  
  inString=${inString##+("$inDelimiter")}

  # Remove tailing delimiters
  inString=${inString%%+("$inDelimiter")}

  # Loop on each char
  for (( i=0; i<${#inString}; i++ )); do
    # Check if the next chars correspond to delimiter
    if [[ ${inString:$i:${#inDelimiter}} = "$inDelimiter" && ${#inDelimiter} -gt 0 ]]; then
      outArray+=("$currentString")
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
  [ -n "$currentString" ] && outArray+=("$currentString")

  ArrayUtils.clone "outArray" "$inArrayName"

  return "$APASH_FUNCTION_SUCCESS"
}
