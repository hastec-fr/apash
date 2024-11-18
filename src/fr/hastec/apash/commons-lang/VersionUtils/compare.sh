#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLongPositive
apash.import fr.hastec.apash.commons-lang.StringUtils.splitAny
apash.import fr.hastec.apash.commons-lang.NumberUtils.max

##/
# @name VersionUtils.isLower
# @brief Compare two versions and determine if the first one is lower than the second one.
# @description
#   As convention, any piece of comparison would be considered as alphanumeric if at least 1
#   char is not a digit. Otherwise, a numeric comparison is applied.
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
# | $1     | inString       | string        | in       |            | The first version to check            |
# | $2     | inString       | string        | in       |            | The second version to check           |
#
# ### Example
# ```bash
#    VersionUtils.isLower "1.2.0"          "1.2.0"         # 0
#    VersionUtils.isLower "1.2.1"          "1.10.0"        # 0
#    VersionUtils.isLower "1.2.0-alpha2"   "1.2.0-alpha10" # 0
#    VersionUtils.isLower "1.2.0-alpha2"   "1.2.0-beta1"   # 0
#    VersionUtils.isLower "1.10.1"         "1.2.0"         # 1
#    VersionUtils.isLower "1.2.0-alpha10"  "1.2.0-alpha2"  # 1
#    VersionUtils.isLower "1.2.0-final"    "1.2.0-alpha2"  # 1
#    VersionUtils.isLower "1.2.0"          "1.2.0-alpha2"  # 1
# ```
#
# @stdout Return -1: when v1 < v2, 0; v1 = v2, 1: v1 > v2, "": when an error occurs.
# @stderr None.
#
# @exitcode 0 If the first version is less or equals than the second one.
# @exitcode 1 Otherwise
#/
VersionUtils.compare() {
  Log.in $LINENO "$@"
  local version1="$1"
  local version2="$2"
  local vArray1=()
  local vArray2=()
  local i

  [[ "$version1" == "$version2" ]] && echo "0" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  
  StringUtils.splitAny "vArray1" "$version1" "." "-"
  StringUtils.splitAny "vArray2" "$version2" "." "-"

  maxIndex=$((APASH_ARRAY_FIRST_INDEX + $(NumberUtils.max "${#vArray1[@]}" "${#vArray2[@]}")))
  for (( i = APASH_ARRAY_FIRST_INDEX ; i < maxIndex; i++)); do
    [[ "${vArray1[i]}" == "${vArray2[i]}" ]] && continue
    
    # Check if it's the pre-release numbers
    # and if one of the version has reached its end.
    if [[ $i -lt $((APASH_ARRAY_FIRST_INDEX+4)) ]]; then
      [[ -n "${vArray1[i]}" && -z "${vArray2[i]}" ]] && echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
      [[ -z "${vArray1[i]}" && -n "${vArray2[i]}" ]] && echo "1"  && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    else
      [[ -n "${vArray1[i]}" && -z "${vArray2[i]}" ]] && echo "1"  && { Log.out $LINENO; return "$APASH_SUCCESS"; }
      [[ -z "${vArray1[i]}" && -n "${vArray2[i]}" ]] && echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    fi

    if NumberUtils.isLongPositive "${vArray1[i]}" \
    && NumberUtils.isLongPositive "${vArray2[i]}" ; then
      if [[ ${vArray1[i]} -lt  ${vArray2[i]}  ]]; then
        echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
      else
        echo "1"  && { Log.out $LINENO; return "$APASH_SUCCESS"; }
      fi
    else # At least one fied is not numeric, then check alphanumeric order
       if [[ "${vArray1[i]}" <  "${vArray2[i]}"  ]]; then
        echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
      else
        echo "1"  && { Log.out $LINENO; return "$APASH_SUCCESS"; }
      fi
    fi
  done
 
  Log.out $LINENO; return "$APASH_FAILURE"
}
