#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.sh
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong


# File description ###########################################################
# @name ArrayUtils.indexOf
# @brief Finds the first index of the given value in the array starting at the given index.
# @description
#   A negative startIndex is treated as zero. A startIndex larger than the array length will return an empty
#
# ### Since:
# 0.1.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
# | $2     | inValue        | string        | in       |            | Value to find.                       |
# | $3 ?   | inValue        | number        | in       | 0          | The index to start searching at.     |
#
# #### Example
# ```bash
#    myIndexes=()
#    ArrayUtils.indexOf  ""       ""         # failure - ""
#    ArrayUtils.indexOf  "myVar"  "a"        # failure - ""
#
#    declare -A myMap
#    ArrayUtils.indexOf  "myMap"  "a"        # failure - ""
#
#    myArray=("a" "b" )
#
#    myArray=("a" "b" "" "c" "b")
#    ArrayUtils.indexOf  "myArray" "b"       # ("1")
#    ArrayUtils.indexOf  "myArray" ""        # ("2")
#    ArrayUtils.indexOf  "myArray"           # failure - ""
#
#    myIndexes=(1 2)
#    myArray=("a" "b")
#    ArrayUtils.indexOf  "myArray" "c"       # -1
#    ArrayUtils.indexOf  "myArray" "a" "3"   # -1
#    ArrayUtils.indexOf  "myArray" "a" "-1"  # 0
#    ArrayUtils.indexOf  "myArray" ""        # -1
# ```
#
# @stdout The index of the value within the array, ArrayUtils_INDEX_NOT_FOUND (-1) if not found.
# @stderr None.
#
# @exitcode 0 When input array references exist and start index is an integer (when declared).
# @exitcode 1 Otherwise.
ArrayUtils.indexOf() {
  # If no value to find explicitly declared, then return
  [[ $# -lt 2 ]] && return "$APASH_FUNCTION_FAILURE"

  local inArrayName="$1"
  local inValue="$2"
  local inStart="${3:-0}"
  local i
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inStart" || return "$APASH_FUNCTION_FAILURE"
  
  [[ $inStart -lt $APASH_ARRAY_FIRST_INDEX ]] && inStart=$APASH_ARRAY_FIRST_INDEX
  if [ "$APASH_SHELL" = "zsh" ]; then
    for ((i = inStart; i < APASH_ARRAY_FIRST_INDEX+${#${(P)inArrayName}[@]} ; i++)); do
      [[ "${${(P)inArrayName}[i]}" == "$inValue" ]] && echo "$i" && return "$APASH_FUNCTION_SUCCESS"
    done
  else
    local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
    for ((i = inStart; i < APASH_ARRAY_FIRST_INDEX+${#inArray[@]} ; i++)); do
      [[ "${inArray[i]}" == "$inValue" ]] && echo "$i" && return "$APASH_FUNCTION_SUCCESS"
    done
  fi
  
  # Return default value if not found
  echo "$ArrayUtils_INDEX_NOT_FOUND" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}