#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.NumberUtils.isInteger
apash.import fr.hastec.apash.lang.Math.abs

##/
# @name StringUtils.rotate
# @brief Rotate (circular shift) a string of shift characters
# @description 
#   * If shift > 0, right circular shift (ex : ABCDEF => FABCDE)
#   * If shift < 0, left circular shift (ex : ABCDEF => BCDEFA)
#   * Empty shift are considered as 0
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
# | $1     | inString       | string        | in       |            | The string to rotate.                 |
# | $2 ?   | inNbChars      | number        | in       | 0          | Number of time to shift.              |
#
# ### Example
# ```bash
#    StringUtils.rotate ""          ""      # ""
#    StringUtils.rotate "abcdefg"   "0"     # "abcdefg"
#    StringUtils.rotate "abcdefg"   "2"     # "fgabcde"
#    StringUtils.rotate "abcdefg"   "-2"    # "cdefgab"
#    StringUtils.rotate "abcdefg"   "7"     # "abcdefg"
#    StringUtils.rotate "abcdefg"   "-7"    # "abcdefg"
#    StringUtils.rotate "abcdefg"   "9"     # "fgabcde"
#    StringUtils.rotate "abcdefg"   "-9"    # "cdefgab"
# ```
#
# @stdout The rotated String, or the original String if shift == 0 or the input string is empty.
#         An empty string if the shift is not a valid number.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 When the shift is not a valid number.
#/
StringUtils.rotate() {
  Log.in $LINENO "$@"
  local inString="$1"
  local inNbChars="${2:-0}"
  local outString=""

  [[ -z $inNbChars ]] && inNbChars=0

  # Check if the second argument is a valid number.
  NumberUtils.isInteger "$inNbChars" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  [[ ${#inString} -eq 0 ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  # Calculate a modulo of the rotation in case shift is greater than
  # string length.
  inNbChars=$((inNbChars % ${#inString}))
  
  if [[ $inNbChars -eq 0 ]]; then
    outString="$inString"
  elif [[ $inNbChars -gt 0 ]]; then
    indexFrom=$((${#inString}-inNbChars))
    outString="${inString:$indexFrom}${inString:0:$indexFrom}"
  else
    inNbChars=$(Math.abs "$inNbChars")
    outString="${inString:$inNbChars}${inString:0:$inNbChars}"
  fi

  echo "$outString" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
