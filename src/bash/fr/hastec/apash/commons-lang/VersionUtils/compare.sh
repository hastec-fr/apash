#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLongPositive
apash.import fr.hastec.apash.commons-lang.StringUtils.splitAny
apash.import fr.hastec.apash.commons-lang.NumberUtils.max
apash.import fr.hastec.apash.commons-lang.VersionUtils.parse

# File description ###########################################################
# @name VersionUtils.isLower
# @brief Compare two versions and determine if the first one is lower than the second one
# @description
#   Please not that for a real comparison, both 
# ### Since:
# 0.2.0
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
# | $1     | inString       | string        | in       |            | The first version to check            |
# | $2     | inString       | string        | in       |            | The second version to check           |
#
# @example
#    VersionUtils.isLower "1.2.0"          "1.2.0"         # 0
#    VersionUtils.isLower "1.2.1"          "1.10.0"        # 0
#    VersionUtils.isLower "1.2.0-alpha2"   "1.2.0-alpha10" # 0
#    VersionUtils.isLower "1.2.0-alpha2"   "1.2.0-beta1"   # 0
#    VersionUtils.isLower "1.10.1"         "1.2.0"         # 1
#    VersionUtils.isLower "1.2.0-alpha10"  "1.2.0-alpha2"  # 1
#    VersionUtils.isLower "1.2.0-final"    "1.2.0-alpha2"  # 1
#    VersionUtils.isLower "1.2.0"          "1.2.0-alpha2"  # 1
#
# @stdout Return -1: when v1 < v2, 0; v1 = v2, 1: v1 > v2, "": when an error occurs.
# @stderr None.
#
# @exitcode 0 If the first version is less or equals than the second one.
# @exitcode 1 Otherwise
VersionUtils.compare() {
  local version1="$1"
  local version2="$2"
  local vArray1=()
  local vArray2=()
  local i

  [[ "$version1" == "$version2" ]] && echo "0" && return "$APASH_FUNCTION_SUCCESS"
  
  StringUtils.splitAny "vArray1" "$version1" "." "-"
  StringUtils.splitAny "vArray2" "$version2" "." "-"

  maxIndex=$((APASH_ARRAY_FIRST_INDEX + $(NumberUtils.max "${#vArray1[@]}" "${#vArray2[@]}")))
  for (( i = APASH_ARRAY_FIRST_INDEX ; i < maxIndex; i++)); do
    [[ "${vArray1[i]}" == "${vArray2[i]}" ]] && continue
    
    # Check if it's the pre-release numbers
    # and if one of the version has reached its end.
    if [[ $i -lt $((APASH_ARRAY_FIRST_INDEX+3)) ]]; then
      [[ -n "${vArray1[i]}" && -z "${vArray2[i]}" ]] && echo "-1" && return "$APASH_FUNCTION_SUCCESS"
      [[ -z "${vArray1[i]}" && -n "${vArray2[i]}" ]] && echo "1" && return "$APASH_FUNCTION_SUCCESS"
    else
      [[ -n "${vArray1[i]}" && -z "${vArray2[i]}" ]] && echo "1" && return "$APASH_FUNCTION_SUCCESS"
      [[ -z "${vArray1[i]}" && -n "${vArray2[i]}" ]] && echo "-1" && return "$APASH_FUNCTION_SUCCESS"
    fi

    if NumberUtils.isLongPositive "${vArray1[i]}" \
    && NumberUtils.isLongPositive "${vArray2[i]}" ; then
      if [[ ${vArray1[i]} -lt  ${vArray2[i]}  ]]; then
        echo "-1" && return "$APASH_FUNCTION_SUCCESS"
      else
        echo "1" && return "$APASH_FUNCTION_SUCCESS"
      fi
    else # At least one fied is not numeric, then check alphanumeric order
       if [[ "${vArray1[i]}" <  "${vArray2[i]}"  ]]; then
        echo "-1" && return "$APASH_FUNCTION_SUCCESS"
      else
        echo "1" && return "$APASH_FUNCTION_SUCCESS"
      fi
    fi
  done
 
  return "$APASH_FUNCTION_FAILURE"
}
