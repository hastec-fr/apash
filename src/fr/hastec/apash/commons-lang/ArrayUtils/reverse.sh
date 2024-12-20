#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

##/
# @name ArrayUtils.reverse
# @brief Reverses the order of the given array in the given range.
# @description
# This method does nothing for non existing array.
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
# | $1     | apash_ioArrayName    | ref(string[]) | in/out   |                 |  Name of the array to reverse.       |
# | $2 ?   | apash_inStartIndex   | number        | in       | 0               |  The starting inclusive index for reversing. Undervalue (<0) is promoted to 0, overvalue (>array.length) results in no change. |
# | $3 ?   | apash_inEndIndex     | number        | in       | ${#1[@]} length |  The ending exclusive index (up to endIndex-1) for reversing. Undervalue (< start index) results in no change. Overvalue (>array.length) is demoted to array length. |
#
# ### Example
# ```bash
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.reverse  "myVar"           # failure
#    ArrayUtils.reverse  "myArray"         # failure
#    ArrayUtils.reverse  "myArray"         # ("d" "" "c" "b" "a")
#
#    myArray=("a")
#    ArrayUtils.reverse  "myArray"  "a"    # ("a")
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.reverse  "myVar" "2"       #  myArray=("a" "b" "d" "" "c")
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.reverse  "myVar" "1" "4"   #  myArray=("a" "" "c" "b" "d")
#
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is reversed.
# @exitcode 1 When the input is not an array or the indexes are not integers.
#/
ArrayUtils.reverse() {
  Log.in $LINENO "$@"
  local apash_ioArrayName="${1:-}"
  local apash_inStartIndex="${2:-0}"
  local apash_inEndIndex="${3:-}"
  local apash_swap=""
  local -a apash_outArray=()
  local apash_lastIndex
  
  ArrayUtils.clone "$apash_ioArrayName" "apash_outArray"           || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_ioArrayName")  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  [[ -z "$apash_inEndIndex" ]] && apash_inEndIndex=$((apash_lastIndex+1))

  NumberUtils.isLong "$apash_inStartIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  NumberUtils.isLong "$apash_inEndIndex"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  [[ $apash_inStartIndex -ge $apash_lastIndex ]]         && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  [[ $apash_inEndIndex   -le $APASH_ARRAY_FIRST_INDEX ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  [[ $apash_inStartIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inStartIndex=$APASH_ARRAY_FIRST_INDEX
  [[ $apash_inEndIndex   -gt $apash_lastIndex ]]         && apash_inEndIndex=$((apash_lastIndex+1))
  
  [[ "$apash_inStartIndex" -ge "$apash_inEndIndex" ]]    && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    
  while [[ $apash_inStartIndex -lt $apash_inEndIndex ]]; do
    apash_swap=${apash_outArray[apash_inStartIndex]}
    apash_outArray[apash_inStartIndex]=${apash_outArray[apash_inEndIndex-1]}
    apash_outArray[apash_inEndIndex-1]="$apash_swap"
    apash_inStartIndex=$((apash_inStartIndex + 1))
    apash_inEndIndex=$((apash_inEndIndex - 1))
  done

  ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
