#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import "fr.hastec.apash.commons-lang.ArrayUtils.clone"

##/
# @name StringUtils.splitPreserveAllTokens
# @brief Splits the provided text into an array preserving all tokens.
# @description 
#   Splits the provided text into an array.eparators specified, 
#   preserving all tokens, including empty tokens created by adjacent separators.
#   The separator is not included in the returned String array. 
#   Adjacent separators are treated as separators for empty tokens.<br/>
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
# | $1     | outArrayName    | string[]      | out      |            | The result array which will contains tokens.     |
# | $2     | apash_inString       | string        | in       |            | The string to split.                             |
# | $3     | apash_inDelimiter    | string        | in       | " "        | The delimiter (can be a sequance of characters). |
#
# ### Example
# ```bash
#    StringUtils.splitPreserveAllTokens myArray ""  ""                    # []
#    StringUtils.splitPreserveAllTokens myArray ""  ":"                   # []
#    StringUtils.splitPreserveAllTokens myArray "ab:cd:ef" ""             # ["ab:cd:ef"]
#    StringUtils.splitPreserveAllTokens myArray "::ab::cd:ef::" ":"       # ["", "", "ab", "", "cd", "ef", ""]
#    StringUtils.splitPreserveAllTokens myArray $'ab\n\ncd\nef' $'\n'     # ["ab", "", "cd", "ef"]
#    StringUtils.splitPreserveAllTokens myArray "abab::cd:ab:ef::ab" "ab" # ["", "", "::cd:", ":ef::", ""]
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When result array exists.
# @exitcode 1 When input array does not exists.
#/
StringUtils.splitPreserveAllTokens() {
  Log.in $LINENO "$@"
  local apash_ioArrayName="${1:-}"  
  local apash_inString="${2:-}"
  local apash_inDelimiter="${3:- }"
  local apash_currentString=""
  local -a apash_outArray=()
  local -i apash_i

  # Loop on each char
  for (( apash_i=0; apash_i<${#apash_inString}; apash_i++ )); do
    # Check if the next chars correspond to delimiter
    if [[ ${apash_inString:$apash_i:${#apash_inDelimiter}} = "$apash_inDelimiter" ]]; then
      apash_outArray+=("$apash_currentString")
      apash_currentString=""
      apash_i=$((apash_i + ${#apash_inDelimiter}-1))

      # If delimiter is at the end, then add an empty token
      [[ apash_i -eq $((${#apash_inString}-1)) ]] && apash_outArray+=("")
      continue
    fi
    apash_currentString+=${apash_inString:$apash_i:1}
  done
  [ -n "$apash_currentString" ] && apash_outArray+=("$apash_currentString")

  ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
