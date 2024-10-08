#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong
apash.import fr.hastec.apash.lang.Math.min

# File description ###########################################################
# @name ArrayUtils.swap
# @brief Swaps a series of elements in the given array.
#
# @description
#   This method does nothing for non existing array.
#   Negative indices are promoted to 0(zero).
#   The swap is stopped at the end of the array and as many as possible elements are swapped.
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
  ArrayUtils.isArray "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  local -n ioArray="$ioArrayName"
  local inStartIndex="$2"
  local inEndIndex="$3"
  local inLen="${4:-1}"
  local i=0
  local swap=""

  NumberUtils.isLong "$inStartIndex" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inEndIndex"   || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inLen"        || return "$APASH_FUNCTION_FAILURE"

  [[ "$inStartIndex" -ge ${#ioArray[@]} ]] && return "$APASH_FUNCTION_SUCCESS"
  [[ "$inEndIndex"   -ge ${#ioArray[@]} ]] && return "$APASH_FUNCTION_SUCCESS"

  [[ "$inStartIndex" -lt 0 ]] && inStartIndex=0
  [[ "$inEndIndex"   -lt 0 ]] && inEndIndex=0

  inLen=$(Math.min "$(Math.min "$inLen" $((${#ioArray[@]}-inStartIndex)))" $((${#ioArray[@]}-inEndIndex)))
  for (( i = 0 ; i < inLen; i++, inStartIndex++, inEndIndex++)); do
    swap=${ioArray[$inStartIndex]}
    ioArray[inStartIndex]=${ioArray[$inEndIndex]}
    ioArray[inEndIndex]=$swap
  done

  return "$APASH_FUNCTION_SUCCESS"
}