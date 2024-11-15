#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong
apash.import fr.hastec.apash.commons-lang.StringUtils.substring
apash.import fr.hastec.apash.commons-lang.StringUtils.isEmpty
apash.import fr.hastec.apash.commons-lang.StringUtils.isAnyEmpty

##/
# @name StringUtils.abbreviate
# @brief Abbreviates a String using ellipses.
# @description
#   This will turn "Now is the time for all good men" into "Now is the time for..."
#   !! WARNING !! The parameter order is not the same than in java to facilitate usage in bash
#   Translated the function from
#   [java documentation](https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/StringUtils.html#line.339)
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
# | $1     | inString       | string        | in       |            | The string to abbreviate.             |
# | $2     | inMaxWidth     | number        | in       |            | Maximum length of result string, must be at least 4. |
# | $3 ?   | inOffsets      | number        | in       | 0          | Left edge of source String.                          |
# | $4 ?   | inMarker       | string        | in       | ...        | The string used as replacement marker.               |
#
# ### Example
# ```bash
#    StringUtils.abbreviate ""              # ""
#    StringUtils.abbreviate ""        4     # ""
#    StringUtils.abbreviate "abcdefg" 6     # "abc..."
#    StringUtils.abbreviate "abcdefg" 7     # "abcdefg"
#    StringUtils.abbreviate "abcdefg" 8     # "abcdefg"
#    StringUtils.abbreviate "abcdefg" 4     # "a..."
#    StringUtils.abbreviate "abcdefg" 3     # failure - ""
# ```
#
# @stdout The abbreviated string.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 when the width is not an integer or is too small.
#/
StringUtils.abbreviate() {
  Log.entry "$LINENO" "$@"
  local inString="$1"
  local inMaxWidth="$2"
  local inOffset="${3:-0}"
  local inMarker="${4:-...}"
  local offset=$inOffset

  NumberUtils.isLong "$inMaxWidth" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inOffset"   || return "$APASH_FUNCTION_FAILURE"

  if (! StringUtils.isEmpty "$inString") && [[ $inMarker = "" && $inMaxWidth -gt 0 ]]; then
    StringUtils.substring "$inString" 0 "$inMaxWidth" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  elif StringUtils.isAnyEmpty "$inString" "$inMarker"; then
    echo "$inString" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  local abbrevMarkerLength=${#inMarker}
  local minAbbrevWidth=$((abbrevMarkerLength + 1))
  local minAbbrevWidthOffset=$((abbrevMarkerLength + abbrevMarkerLength + 1))

  [[ $inMaxWidth -lt $minAbbrevWidth ]] && return "$APASH_FUNCTION_FAILURE"
  
  [[ ${#inString} -le $inMaxWidth ]] && echo "$inString" && return "$APASH_FUNCTION_SUCCESS"
  
  [[ $offset -gt ${#inString} ]] && offset=${#inString}

  if (( ${#inString} - offset < inMaxWidth - abbrevMarkerLength)); then
    offset=$(( ${#inString} - (inMaxWidth - abbrevMarkerLength) ))
  fi

  if (( offset <= abbrevMarkerLength + 1 )); then
    echo "$(StringUtils.substring "$inString" 0 $((inMaxWidth - abbrevMarkerLength)))$inMarker" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  if ((inMaxWidth < minAbbrevWidthOffset)); then
    return "$APASH_FUNCTION_FAILURE"
  fi

  if (( offset + inMaxWidth - abbrevMarkerLength < ${#inString} )); then
    echo "$inMarker$(StringUtils.abbreviate "$(StringUtils.substring "$inString" "$offset")" $((inMaxWidth - abbrevMarkerLength)) 0 "$inMarker")" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi
  
  echo "$inMarker$(StringUtils.substring "$inString" $((${#inString} - (inMaxWidth - abbrevMarkerLength))))" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
