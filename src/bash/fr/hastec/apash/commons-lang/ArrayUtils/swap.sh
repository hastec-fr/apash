#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.NumberUtils.isInteger
apash.import fr.hastec.apash.lang.Math.min

# File description ###########################################################
# @name ArrayUtils.swap
# @brief Swaps a series of elements in the given array.
#
# @description
# This method does nothing for non existing array.
# Negative indices are promoted to 0(zero).
# The swap is stopped at the end of the array and as many as possible elements are swapped.
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
# @arg $1 ref(string[]) Name of the array to swap. [Default: N/A]
# @arg $2 number The index of the first element in the series to swap [Default: N/A]
# @arg $3 number The index of the second element in the series to swap [Default: N/A]
# @arg $4 number The number of elements to swap starting with the given indices. [Default: 1]
#
# @stdout None.
# @stderr None.
#
# @see https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286
# @exitcode 0 When the array is swaped.
# @exitcode 1 When the input is not an array or the offset/indexes are not integers.
ArrayUtils.swap() {
  local ioArrayRef="$1"
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"
  local -n inArray="$ioArrayRef"
  local inStartIndex="$2"
  local inEndIndex="$3"
  local inLen="${4:-1}"
  local i=0
  local swap=""

  NumberUtils.isInteger "$inStartIndex" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isInteger "$inEndIndex"   || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isInteger "$inLen"        || return "$APASH_FUNCTION_FAILURE"

  [[ "$inStartIndex" -ge ${#inArray[@]} ]] && return "$APASH_FUNCTION_SUCCESS"
  [[ "$inEndIndex"   -ge ${#inArray[@]} ]] && return "$APASH_FUNCTION_SUCCESS"

  [[ "$inStartIndex" -lt 0 ]] && inStartIndex=0
  [[ "$inEndIndex"   -lt 0 ]] && inEndIndex=0

  inLen=$(Math.min "$(Math.min "$inLen" $((${#inArray[@]}-inStartIndex)))" $((${#inArray[@]}-inEndIndex)))
  for (( i = 0 ; i < inLen; i++, inStartIndex++, inEndIndex++)); do
    swap=${inArray[$inStartIndex]}
    inArray[inStartIndex]=${inArray[$inEndIndex]}
    inArray[inEndIndex]=$swap
  done

  return "$APASH_FUNCTION_SUCCESS"
}