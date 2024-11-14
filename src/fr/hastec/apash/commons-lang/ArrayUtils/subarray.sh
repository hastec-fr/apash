#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

##/
# @name ArrayUtils.subarray
# @brief Produces a new array containing the elements between the start and end indices.
# @description
#   The start index is inclusive, the end index exclusive. 
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
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
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the subarray is extracted.
# @exitcode 1 When the input is not an array or the indexes are not integers.
#
# @see https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286
#/
ArrayUtils.subarray() {
  Log.entry "$LINENO" "$@"
  local outSubArrayName="$1"
  local inArrayName="$2"
  local inStartIndex="$3"
  local inEndIndex="$4"
  local inArray=()
  local outArray=()
  local lastIndex

  ArrayUtils.isArray "$inArrayName"  || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inStartIndex" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inEndIndex"   || return "$APASH_FUNCTION_FAILURE"

  ArrayUtils.clone "$inArrayName" "inArray" || return "$APASH_FUNCTION_FAILURE"
  lastIndex=$(ArrayUtils.getLastIndex "$inArrayName") || return "$APASH_FUNCTION_FAILURE"

  [[ $inStartIndex -gt $lastIndex ]] && return "$APASH_FUNCTION_SUCCESS"
  [[ $inStartIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && inStartIndex=$APASH_ARRAY_FIRST_INDEX
  [[ $inEndIndex   -lt $APASH_ARRAY_FIRST_INDEX ]] && inEndIndex=$APASH_ARRAY_FIRST_INDEX
  [[ $inEndIndex   -gt $lastIndex ]] && inEndIndex=$((lastIndex+1))

  [[ $inStartIndex -gt $inEndIndex    ]] && return "$APASH_FUNCTION_SUCCESS"

  # shellcheck disable=SC2034
  # Subarray always start at the index 0, so the the first index is removed.
  outArray=("${inArray[@]:$inStartIndex-$APASH_ARRAY_FIRST_INDEX:$inEndIndex-$inStartIndex}")

  ArrayUtils.clone "outArray" "$outSubArrayName" || return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}
