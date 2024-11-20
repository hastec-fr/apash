#!/usr/bin/env bash

# Dependencies #################################################################
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
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | outArrayName   | string[]      | out      |            | The result array which will contains tokens.     |
# | $2     | apash_inString       | string        | in       |            | The string to split.                             |
# | $3     | apash_inDelimiter    | string        | in       | " "        | The delimiter (can be a sequence of characters). |
#
# ### Example
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
  Log.in $LINENO "$@"
  local apash_inArrayName="${1:-}"
  local apash_inString="${2:-}"
  local apash_inDelimiter="${3:- }"
  local apash_currentString=""
  local -i apash_i
  local -a apash_outArray=()

  # Remove starting delimiters
  
  apash_inString=${apash_inString##+("$apash_inDelimiter")}

  # Remove tailing delimiters
  apash_inString=${apash_inString%%+("$apash_inDelimiter")}

  # Loop on each char
  for (( apash_i=0; apash_i<${#apash_inString}; apash_i++ )); do
    # Check if the next chars correspond to delimiter
    if [[ ${apash_inString:$apash_i:${#apash_inDelimiter}} = "$apash_inDelimiter" && ${#apash_inDelimiter} -gt 0 ]]; then
      apash_outArray+=("$apash_currentString")
      apash_currentString=""
      while [[ ${apash_inString:$apash_i:${#apash_inDelimiter}} = "$apash_inDelimiter" ]]; do
        # Skip the number of chars corresponding to the delimiter.
        apash_i=$((apash_i + ${#apash_inDelimiter}))
      done
      # Compense the last increment realize by for loop
      apash_i=$((apash_i - 1))
      continue
    fi
    apash_currentString+=${apash_inString:$apash_i:1}
  done
  [ -n "$apash_currentString" ] && apash_outArray+=("$apash_currentString")

  ArrayUtils.clone "apash_outArray" "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
