#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

# File description ###########################################################
# @name ArrayUtils.subarray
# @brief Produces a new array containing the elements between the start and end indices.
# @description
#   The start index is inclusive, the end index exclusive. 
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
# | $1     | outSubArrayName| ref(string[]) | out      |                 | Name of the array to subarray.       |
# | $2     | inArrayName    | ref(string[]) | in       |                 | Name of the original array.          |
# | $3     | inStartIndex   | number        | in       |                 | The starting index. Undervalue (<0) is promoted to 0, overvalue (>array.length) results in an empty array.        |
# | $4     | inEndIndex     | number        | in       |                 | The elements up to endIndex-1 are present in the returned subarray. Undervalue (< startIndex) produces empty array, overvalue (>array.length) is demoted to array. |
#
# #### Example
# ```bash
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.subarray  "mySubArray"  "myArray"                 # failure - ""
#    ArrayUtils.subarray  "mySubArray"  "myArray"  "0"            # failure - ""
#    ArrayUtils.subarray  "mySubArray"  "myArray"  "0" "2"        # mySubArray=("a" "b" "c")
#
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.subarray  "mySubArray"  "myArray"  "1" "2"        # mySubArray=("b" "c")
#
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.subarray  "mySubArray"  "myArray"  "0" "2" "2"    # mySubArray=("c" "d" "a" "b")
#
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.subarray  "mySubArray"  "myArray"  "0" "2" "0"    # mySubArray=("a" "b" "c" "d")
#
#    myArray=("a" "b" "c" "d" "e")
#    ArrayUtils.subarray  "mySubArray"  "myArray"  "0" "2" "2"    # mySubArray=("c" "d" "a" "b" "e")
#
#    myArray=("a" "b" "c" "d" "e")
#    ArrayUtils.subarray  "mySubArray"  "myArray"  "1" "3"  "3"   # mySubArray=("a" "d" "e" "b" "c")
#
# ```
#
# @stdout None.
# @stderr None.
#
# @see https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286
# @exitcode 0 When the subarray is extracted.
# @exitcode 1 When the input is not an array or the indexes are not integers.
ArrayUtils.subarray() {
  local outSubArrayName="$1"
  local inArrayName="$2"
  local inStartIndex="$3"
  local inEndIndex="$4"
  local inArray=()
  local outArray=()

  ArrayUtils.isArray "$inArrayName"  || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inStartIndex" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inEndIndex"   || return "$APASH_FUNCTION_FAILURE"

  ArrayUtils.clone "$inArrayName" "inArray" || return "$APASH_FUNCTION_FAILURE"

  [[ $inStartIndex -ge ${#inArray[@]} ]] && return "$APASH_FUNCTION_SUCCESS"
  [[ $inStartIndex -lt 0 ]] && inStartIndex=0
  [[ $inEndIndex   -lt 0 ]] && inEndIndex=0
  [[ $inEndIndex   -gt ${#inArray[@]} ]] && inEndIndex=${#inArray[@]}

  [[ $inStartIndex -gt $inEndIndex    ]] && return "$APASH_FUNCTION_SUCCESS"

  # shellcheck disable=SC2034
  outArray=("${inArray[@]:$inStartIndex:$((inEndIndex - inStartIndex))}")

  ArrayUtils.clone "outArray" "$outSubArrayName" || return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}
