#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong
apash.import fr.hastec.apash.lang.Math.min

##/
# @name ArrayUtils.swap
# @brief Swaps a series of elements in the given array.
# @description
#   This method does nothing for non existing array.
#   Negative indices are promoted to 0(zero).
#   The swap is stopped at the end of the array and as many as possible elements are swapped.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default         | Description                          |
# |--------|----------------|---------------|----------|-----------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | out      |                 | Name of the array to swap.           |
# | $2     | inStartIndex   | number        | in       |                 | The index of the first element in the series to swap   |
# | $3     | inEndIndex     | number        | in       |                 | The index of the second element in the series to swap  |
# | $4     | inLen          | number        | in       | 1               | The number of elements to swap starting with the given indices. |
#
# ### Example
# ```bash
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.swap    "myArray"                 # failure
#    ArrayUtils.swap    "myArray"  "2"            # failure
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
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is swaped.
# @exitcode 1 When the input is not an array or the offset/indexes are not integers.
#
# @see https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286
#/
ArrayUtils.swap() {
  Log.in $LINENO "$@"
  local ioArrayName="${1:-}"
  local inStartIndex="${2:-}"
  local inEndIndex="${3:-}"
  local inLen="${4:-1}"
  local i=0
  local swap=""
  local -a apash_ArrayUtils_swap_outArray=()
  local lastIndex

  NumberUtils.isLong "$inStartIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  NumberUtils.isLong "$inEndIndex"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  NumberUtils.isLong "$inLen"        || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  ArrayUtils.clone "$ioArrayName" "apash_ArrayUtils_swap_outArray"    || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  lastIndex=$(ArrayUtils.getLastIndex "$ioArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # Nothing to swap.
  [[ $inStartIndex -gt $lastIndex ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  [[ $inEndIndex   -gt $lastIndex ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  [[ $inStartIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && inStartIndex=$APASH_ARRAY_FIRST_INDEX
  [[ $inEndIndex   -lt $APASH_ARRAY_FIRST_INDEX ]] && inEndIndex=$APASH_ARRAY_FIRST_INDEX

  inLen=$(Math.min "$(Math.min "$inLen" $((lastIndex+1-inStartIndex)))" $((lastIndex+1-inEndIndex)))
  for (( i = 0 ; i < inLen; i++, inStartIndex++, inEndIndex++)); do
    swap=${apash_ArrayUtils_swap_outArray[$inStartIndex]}
    apash_ArrayUtils_swap_outArray[inStartIndex]=${apash_ArrayUtils_swap_outArray[$inEndIndex]}
    apash_ArrayUtils_swap_outArray[inEndIndex]=$swap
  done
  ArrayUtils.clone "apash_ArrayUtils_swap_outArray" "$ioArrayName"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
