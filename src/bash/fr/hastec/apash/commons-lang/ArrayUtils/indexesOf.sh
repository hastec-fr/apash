#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

# File description ###########################################################
# @name ArrayUtils.indexesOf
# @brief Finds the indices of the given value in the array starting at the given index.
# @description
#   A negative startIndex is treated as zero. 
#   A startIndex larger than the array length will return an empty.
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
# | $1     | outArrayName   | ref(string[]) | out      |            | Name of the output array storing result indexes.    |
# | $2     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
# | $3     | inValue        | string        | in       |            | Value to find.                       |
# | $4 ?   | inStart        | number        | in       | 0          | The index to start searching at.     |
#
#
# #### Example
# ```bash
#    myIndexes=()
#    ArrayUtils.indexesOf "myIndexes" ""       ""     # failure - ()
#    ArrayUtils.indexesOf "myIndexes" "myVar"  "a"    # failure - ()
#
#    declare -A myMap
#    ArrayUtils.indexesOf "myIndexes" "myMap"  "a"    # failure - ()
#
#    myArray=("a" "b" "" "c" "b")
#    ArrayUtils.indexesOf "myIndexes" "myArray" "b"   # ("1" "4")
#
#    myIndexes=(1 2)
#    myArray=("a" "b")
#    ArrayUtils.indexesOf "myIndexes" "myArray" "c"       # ()
#    ArrayUtils.indexesOf "myIndexes" "myArray" "a" "3"   # ()
#    ArrayUtils.indexesOf "myIndexes" "myArray" "a" "-1"  # (0)
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When input array references exist.
# @exitcode 1 Otherwise.
ArrayUtils.indexesOf() {
  local outIndexesName="$1"
  ArrayUtils.nullToEmpty "$outIndexesName" || return "$APASH_FUNCTION_FAILURE"

  local inArrayName="$2"
  local inValue="$3"
  local inStart="${4:-0}"
  local -n outIndexes="$outIndexesName"         || return "$APASH_FUNCTION_FAILURE"
  local -n inArray="$inArrayName" 2> /dev/null  || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$inArrayName"             || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inStart"                || return "$APASH_FUNCTION_FAILURE"
  # Reset the indexes array
  outIndexes=()
  
  [[ $inStart -lt 0 ]] && inStart=0

  for ((i = inStart; i < ${#inArray[@]} ; i++)); do
    [[ "${inArray[i]}" == "$inValue" ]] && outIndexes+=("$i")
  done
  return "$APASH_FUNCTION_SUCCESS"
}