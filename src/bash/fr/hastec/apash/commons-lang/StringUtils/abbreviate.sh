#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isInteger
apash.import fr.hastec.apash.commons-lang.StringUtils.substring
apash.import fr.hastec.apash.commons-lang.StringUtils.isEmpty
apash.import fr.hastec.apash.commons-lang.StringUtils.isAnyEmpty

# File description ###########################################################
# @name StringUtils.abbreviate
# @brief Abbreviates a String using ellipses.
# @description
# This will turn "Now is the time for all good men" into "Now is the time for..."
# !! WARNING !! The parameter order is not the same than in java to facilitate usage in bash
# To be honest, I don't understand this logic ;D, so I have transalted the function from
# [java documentation](https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/StringUtils.html#line.339)
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
#    StringUtils.abbreviate ""              # ""
#    StringUtils.abbreviate ""        4     # ""
#    StringUtils.abbreviate "abcdefg" 6     # "abc..."
#    StringUtils.abbreviate "abcdefg" 7     # "abcdefg"
#    StringUtils.abbreviate "abcdefg" 8     # "abcdefg"
#    StringUtils.abbreviate "abcdefg" 4     # "a..."
#    StringUtils.abbreviate "abcdefg" 3     # failure - ""
#
# @arg $1 string The string to abbreviate.
# @agr $2 number Maximum length of result string, must be at least 4.
# @arg $3 string The string used as replacement marker. (Default: "...")
# @arg $4 string Left edge of source String. (Default: 0)
#
# @stdout The abbreviated string.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 when the width is not an integer or is too small.
StringUtils.abbreviate() {
  local inString="$1"
  local inMaxWidth="$2"
  local inOffset="${3:-0}"
  local inMarker="${4:-...}"
  local offset=$inOffset

  NumberUtils.isInteger "$inMaxWidth" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isInteger "$inOffset"   || return "$APASH_FUNCTION_FAILURE"

  # echo "Par ici 1"
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

