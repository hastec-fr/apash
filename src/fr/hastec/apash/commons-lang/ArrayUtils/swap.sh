#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong
apash.import fr.hastec.apash.lang.Math.min

##/
# @name ArrayUtils.apash_swap
# @brief Swaps a series of elements in the given array.
# @description
#   This method does nothing for non existing array.
#   Negative indices are promoted to 0(zero).
#   The apash_swap is stopped at the end of the array and as many as possible elements are swapped.
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
# | $1     | apash_ioArrayName    | ref(string[]) | out      |                 | Name of the array to swap.           |
# | $2     | apash_inStartIndex   | number        | in       |                 | The index of the first element in the series to swap   |
# | $3     | apash_inEndIndex     | number        | in       |                 | The index of the second element in the series to swap  |
# | $4     | apash_inLen          | number        | in       | 1               | The number of elements to swap starting with the given indices. |
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
  local apash_ioArrayName="${1:-}"
  local apash_inStartIndex="${2:-}"
  local apash_inEndIndex="${3:-}"
  local apash_inLen="${4:-1}"
  local apash_swap=""
  local -i i  
  local -a apash_ArrayUtils_swap_outArray=()
  local apash_lastIndex

  NumberUtils.isLong "$apash_inStartIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  NumberUtils.isLong "$apash_inEndIndex"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  NumberUtils.isLong "$apash_inLen"        || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  ArrayUtils.clone "$apash_ioArrayName" "apash_ArrayUtils_swap_outArray"    || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_ioArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # Nothing to apash_swap.
  [[ $apash_inStartIndex -gt $apash_lastIndex ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  [[ $apash_inEndIndex   -gt $apash_lastIndex ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  [[ $apash_inStartIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inStartIndex=$APASH_ARRAY_FIRST_INDEX
  [[ $apash_inEndIndex   -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inEndIndex=$APASH_ARRAY_FIRST_INDEX

  apash_inLen=$(Math.min "$(Math.min "$apash_inLen" $((apash_lastIndex+1-apash_inStartIndex)))" $((apash_lastIndex+1-apash_inEndIndex)))
  for (( i=0; i < apash_inLen; i++, apash_inStartIndex++, apash_inEndIndex++ )); do
    apash_swap=${apash_ArrayUtils_swap_outArray[$apash_inStartIndex]}
    apash_ArrayUtils_swap_outArray[apash_inStartIndex]=${apash_ArrayUtils_swap_outArray[$apash_inEndIndex]}
    apash_ArrayUtils_swap_outArray[apash_inEndIndex]=$apash_swap
  done
  ArrayUtils.clone "apash_ArrayUtils_swap_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
