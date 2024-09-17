#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.NumberUtils.isInteger

# File description ###########################################################
# @name ArrayUtils.indexesOf
# @brief Finds the indices of the given value in the array starting at the given index.
#
# @description
# A negative startIndex is treated as zero. A startIndex larger than the array length will return an empty
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
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
# @arg $1 ref(number[]) Name of the output array getting result indexes.
# @arg $2 ref(string[]) Name of the array to check.
# @arg $3 string Value to find.
# @arg $4 number The index to start searching at.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When input array references exist.
# @exitcode 1 Otherwise.
ArrayUtils.indexesOf() {
  local outIndexesRef="$1"
  local inArrayRef="$2"
  local inValue="$3"
  local inStart="${4:-0}"
  local -n outIndexes="$outIndexesRef" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  local -n inArray="$inArrayRef" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  ArrayUtils.isArray "$outIndexesRef" || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$inArrayRef" || return "$APASH_FUNCTION_FAILURE"  
  NumberUtils.isInteger "$inStart" || return "$APASH_FUNCTION_FAILURE"
  # Reset the indexes array  
  outIndexes=()
  
  [[ $inStart -lt 0 ]] && inStart=0
  for ((i = inStart; i < ${#inArray[@]} ; i++)); do
    [[ "${inArray[i]}" == "$inValue" ]] && outIndexes+=("$i")
  done
  return "$APASH_FUNCTION_SUCCESS"
}