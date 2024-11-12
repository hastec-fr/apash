#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong
apash.import fr.hastec.apash.lang.Math.min

# File description ###########################################################
# @name ArrayUtils.swap
# @brief Swaps a series of elements in the given array.
# @description
#   This method does nothing for non existing array.
#   Negative indices are promoted to 0(zero).
#   The swap is stopped at the end of the array and as many as possible elements are swapped.
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
# | #      | varName        | Type          | in/out   | Default         | Description                          |
# |--------|----------------|---------------|----------|-----------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | out      |                 | Name of the array to swap.           |
# | $2     | inStartIndex   | number        | in       |                 | The index of the first element in the series to swap   |
# | $3     | inEndIndex     | number        | in       |                 | The index of the second element in the series to swap  |
# | $4     | inLen          | number        | in       | 1               | The number of elements to swap starting with the given indices. |
#
# #### Example
# ```bash
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.swap    "myArray"                 # failure - ""
#    ArrayUtils.swap    "myArray"  "2"            # failure - ""
#    ArrayUtils.swap    "myArray"  "0" "2"        # ("c" "b" "a" "d")
#
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.swap    "myArray"  "0" "2" "1"    # ("c" "b" "a" "d")
#
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.swap    "myArray"  "0" "2" "2"    # ("c" "d" "a" "b")
#
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.swap    "myArray"  "0" "2" "0"    # ("a" "b" "c" "d")
#
#    myArray=("a" "b" "c" "d" "e")
#    ArrayUtils.swap    "myArray"  "0" "2" "2"    # ("c" "d" "a" "b" "e")
#
#    myArray=("a" "b" "c" "d" "e")
#    ArrayUtils.swap    "myArray"  "1" "3"  "3"   # ("a" "d" "e" "b" "c")
#
# ```
#
# @stdout None.
# @stderr None.
#
# @see https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286
#
# @exitcode 0 When the array is swaped.
# @exitcode 1 When the input is not an array or the offset/indexes are not integers.
ArrayUtils.swap() {
  local ioArrayName="$1"
  local inStartIndex="$2"
  local inEndIndex="$3"
  local inLen="${4:-1}"
  local i=0
  local swap=""
  local ref_ArrayUtils_swap_outArray=()
  local lastIndex

  NumberUtils.isLong "$inStartIndex" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inEndIndex"   || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inLen"        || return "$APASH_FUNCTION_FAILURE"

  ArrayUtils.clone "$ioArrayName" "ref_ArrayUtils_swap_outArray"          || return "$APASH_FUNCTION_FAILURE"
  lastIndex=$(ArrayUtils.getLastIndex "$ioArrayName") || return "$APASH_FUNCTION_FAILURE"

  # Nothing to swap.
  [[ $inStartIndex -gt $lastIndex ]] && return "$APASH_FUNCTION_SUCCESS"
  [[ $inEndIndex   -gt $lastIndex ]] && return "$APASH_FUNCTION_SUCCESS"

  [[ $inStartIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && inStartIndex=$APASH_ARRAY_FIRST_INDEX
  [[ $inEndIndex   -lt $APASH_ARRAY_FIRST_INDEX ]] && inEndIndex=$APASH_ARRAY_FIRST_INDEX

  inLen=$(Math.min "$(Math.min "$inLen" $((lastIndex+1-inStartIndex)))" $((lastIndex+1-inEndIndex)))
  for (( i = 0 ; i < inLen; i++, inStartIndex++, inEndIndex++)); do
    swap=${ref_ArrayUtils_swap_outArray[$inStartIndex]}
    ref_ArrayUtils_swap_outArray[inStartIndex]=${ref_ArrayUtils_swap_outArray[$inEndIndex]}
    ref_ArrayUtils_swap_outArray[inEndIndex]=$swap
  done
  ArrayUtils.clone "ref_ArrayUtils_swap_outArray" "$ioArrayName"  || return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}
