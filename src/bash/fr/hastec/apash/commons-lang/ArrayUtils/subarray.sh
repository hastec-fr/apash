#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

# File description ###########################################################
# @name ArrayUtils.subarray
# @brief Produces a new array containing the elements between the start and end indices.
#
# @description
# The start index is inclusive, the end index exclusive. 
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
#    ArrayUtils.subarray    "myArray"                 # failure - ""
#    ArrayUtils.subarray    "myArray"  "0"            # failure - ""
#    ArrayUtils.subarray    "myArray"  "0" "2"        # ("a" "b" "c")
#
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.subarray    "myArray"  "1" "2"        # ("b" "c")
#
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.subarray    "myArray"  "0" "2" "2"    # ("c" "d" "a" "b")
#
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.subarray    "myArray"  "0" "2" "0"    # ("a" "b" "c" "d")
#
#    myArray=("a" "b" "c" "d" "e")
#    ArrayUtils.subarray    "myArray"  "0" "2" "2"    # ("c" "d" "a" "b" "e")
#
#    myArray=("a" "b" "c" "d" "e")
#    ArrayUtils.subarray    "myArray"  "1" "3"  "3"   # ("a" "d" "e" "b" "c")
#
# ```
#
# @arg $1 ref(string[]) Name of the array to subarray. [Default: N/A]
# @arg $2 ref(string[]) Name of the original array. [Default: N/A]
# @arg $2 number The starting index. Undervalue (<0) is promoted to 0, overvalue (>array.length) results in an empty array.
# @arg $3 number The elements up to endIndex-1 are present in the returned subarray. Undervalue (< startIndex) produces empty array, overvalue (>array.length) is demoted to array
#
# @stdout None.
# @stderr None.
#
# @see https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286
# @exitcode 0 When the subarray is extracted.
# @exitcode 1 When the input is not an array or the indexes are not integers.
ArrayUtils.subarray() {
  local ioSubArrayRef="$1"
  local ioArrayRef="$2"
  local inStartIndex="$3"
  local inEndIndex="$4"

  ArrayUtils.isArray "$ioSubArrayRef"   || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$ioArrayRef"      || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inStartIndex" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inEndIndex"   || return "$APASH_FUNCTION_FAILURE"

  local -n subArray="$ioSubArrayRef"
  local -n inArray="$ioArrayRef"
  subArray=()

  [[ $inStartIndex -ge ${#inArray[@]} ]] && return "$APASH_FUNCTION_SUCCESS"
  [[ $inStartIndex -lt 0 ]] && inStartIndex=0
  [[ $inEndIndex   -lt 0 ]] && inEndIndex=0
  [[ $inEndIndex   -gt ${#inArray[@]} ]] && inEndIndex=${#inArray[@]}

  [[ $inStartIndex -gt $inEndIndex    ]] && return "$APASH_FUNCTION_SUCCESS"

  # shellcheck disable=SC2034
  subArray=("${inArray[@]:$inStartIndex:$((inEndIndex - inStartIndex))}")

  return "$APASH_FUNCTION_SUCCESS"
}