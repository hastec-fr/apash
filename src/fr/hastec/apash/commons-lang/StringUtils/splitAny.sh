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
# | $2     | inString       | string        | in       |            | The string to split.                             |
# | $3     | inDelimiters   | string...     | in       | " "        | The delimiter (can be a sequence of characters). |
#
# ### Example
# ```bash
#    StringUtils.split myArray "ab:c,d:e,f" ":" ","           # ["ab", c, d, e, f ]
#    StringUtils.split myArray ":,:ab::c,d:::e,f:,:" ":" ","  # ["ab", c, d, e, f ]
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
StringUtils.splitAny() {
  Log.in $LINENO "$@"
  local inArrayName="${1:-}"
  local inString="${2:-}"
  shift 2
  local -a inDelimiters=("${@}")
  local currentString=""
  local i d matchD
  local -a outArray=()

  # Remove starting delimiters (need to check all)
  # @todo: should check how to implement loop keeper.
  local tmpStr="x$inString"
  while [[ $tmpStr != "$inString" ]]; do
    tmpStr="$inString"
    for d in "${inDelimiters[@]}"; do
      inString=${inString##+("$d")}
    done
  done

  # Remove tailing delimiters
  tmpStr="x$inString"
  while [[ $tmpStr != "$inString" ]]; do
    tmpStr="$inString"
    for d in "${inDelimiters[@]}"; do
      inString=${inString%%+("$d")}
    done
  done

  # Loop on each char
  for (( i=0; i<${#inString}; i++ )); do
    # Initialize delimiter matching
    matchD="false"
    for d in "${inDelimiters[@]}"; do
      # Check if the next chars correspond to delimiter
      if [[ ${inString:$i:${#d}} = "$d" && ${#d} -gt 0 ]]; then
        outArray+=("$currentString")
        currentString=""
        while [[ ${inString:$i:${#d}} = "$d" ]]; do
          # Skip the number of chars corresponding to the delimiter
          i=$((i + ${#d}))
        done
        # Compense the last increment realize by for loop
        i=$((i - 1))

        # break the current delimiter maching
        matchD="true"
        break
      fi
    done
    [[ "$matchD" == "true" ]] && continue # as for split
    currentString+=${inString:$i:1}
  done
  [ -n "$currentString" ] && outArray+=("$currentString")

  ArrayUtils.clone "outArray" "$inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
