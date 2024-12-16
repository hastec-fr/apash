#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name StringUtils.splitAny
# @brief Splits the provided text into an array according to the multiple inputs strings.
# @description
#   Non array reference will be transformed to empty array.
#   Default separator is " "
#   The separator is not included in the returned String array.
#   Adjacent separators are treated as one separator. Leading and tailing separators
#   are not considered. Strings are split in the order of the matching. <br/>
#   @todo: Optimize this function.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | outArrayName   | string[]      | out      |            | The result array which will contains tokens.     |
# | $2     | apash_inString       | string        | in       |            | The string to split.                             |
# | $3     | apash_inDelimiters   | string...     | in       | " "        | The delimiter (can be a sequence of characters). |
#
# ### Example
# ```bash
#    StringUtils.split myArray "ab:c,apash_d:e,f" ":" ","           # ["ab", c, apash_d, e, f ]
#    StringUtils.split myArray ":,:ab::c,apash_d:::e,f:,:" ":" ","  # ["ab", c, apash_d, e, f ]
#    StringUtils.split myArray $'ab\n\ncd\nef' $'\n'          # ["ab", "cd", "ef"]
#    StringUtils.split myArray "abab::cd:ab:ef::ab" "ab"      # ["::cd:", ":ef::"]
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When result array exists.
# @exitcode 1 When input array does not exists.
#/
alias StringUtils.splitAny="StringUtils_splitAny"
function StringUtils_splitAny {
  Log.in $LINENO "$@"
  local apash_inArrayName="${1:-}"
  local apash_inString="${2:-}"
  shift 2
  local -a apash_inDelimiters=("${@}")
  local apash_currentString=""
  local apash_d apash_matchD
  local -i apash_i
  local -a apash_outArray=()

  # Remove starting delimiters (need to check all)
  # @todo: should check how to implement loop keeper.
  local tmpStr="x$apash_inString"
  while [[ $tmpStr != "$apash_inString" ]]; do
    tmpStr="$apash_inString"
    for apash_d in "${apash_inDelimiters[@]}"; do
      apash_inString=${apash_inString##+("$apash_d")}
    done
  done

  # Remove tailing delimiters
  tmpStr="x$apash_inString"
  while [[ $tmpStr != "$apash_inString" ]]; do
    tmpStr="$apash_inString"
    for apash_d in "${apash_inDelimiters[@]}"; do
      apash_inString=${apash_inString%%+("$apash_d")}
    done
  done

  # Loop on each char
  for (( apash_i=0; apash_i<${#apash_inString}; apash_i++ )); do
    # Initialize delimiter matching
    apash_matchD="false"
    for apash_d in "${apash_inDelimiters[@]}"; do
      # Check if the next chars correspond to delimiter
      if [[ ${apash_inString:$apash_i:${#apash_d}} = "$apash_d" && ${#apash_d} -gt 0 ]]; then
        apash_outArray+=("$apash_currentString")
        apash_currentString=""
        while [[ ${apash_inString:$apash_i:${#apash_d}} = "$apash_d" ]]; do
          # Skip the number of chars corresponding to the delimiter
          apash_i=$((apash_i + ${#apash_d}))
        done
        # Compense the last increment realize by for loop
        apash_i=$((apash_i - 1))

        # break the current delimiter maching
        apash_matchD="true"
        break
      fi
    done
    [[ "$apash_matchD" == "true" ]] && continue # as for split
    apash_currentString+=${apash_inString:$apash_i:1}
  done
  [ -n "$apash_currentString" ] && apash_outArray+=("$apash_currentString")

  ArrayUtils.clone "apash_outArray" "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
