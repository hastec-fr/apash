#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.swap
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

##/
# @name ArrayUtils.shift
# @brief Shifts the order of a series of elements in the given array.
# @description
#   This method does nothing for non existing array.
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
# | $1     | apash_ioArrayName    | ref(string[]) | in       |                 |  Name of the array to shift.         |
# | $2 ?   | apash_inOffset       | number        | in       | 0               |  The number of positions to rotate the elements. If the offset is larger than the number of elements to rotate, than the effective offset is modulo the number of elements to rotate. |
# | $3 ?   | apash_inStartIndex   | number        | in       | 0               |  The starting inclusive index for reversing. Undervalue (<0) is promoted to 0, overvalue (>array.length) results in no change. |
# | $4 ?   | apash_inEndIndex     | number        | in       | apash_lastIndex+1     |  The ending exclusive index (up to endIndex-1) for reversing. Undervalue (< start index) results in no change. Overvalue (>array.length) is demoted to array length. |
#
# ### Example
# ```bash
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.shift    "myArray"                    # ("a" "b" "c" "" "d")
#    ArrayUtils.shift    "myArray"  "2"               # ("" "d" "a" "b" "c")
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.shift    "myArray"  "${#myArray[@]}"  # ("a" "b" "c" "" "d")
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.shift    "myArray"  "1" "3"           # ("a" "b" "c" "d" "")
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.shift    "myArray"  "1" "1" "3"       # ("a" "" "b" "c" "d")
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.shift    "myArray"  "-1"              # ("b" "c" "" "d" "a")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is shifted.
# @exitcode 1 When the input is not an array or the offset/indexes are not integers.
#
# @see https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.6959
#/
ArrayUtils.shift() {
  Log.in $LINENO "$@"
  local apash_ioArrayName="${1:-}"
  local apash_inOffset="${2:-0}"
  local apash_inStartIndex="${3:-0}"
  local apash_inEndIndex="${4:-}"
  local apash_distance=0
  local apash_distance_offset=0
  local apash_lastIndex
  local -a apash_outArray=()
  
  ArrayUtils.clone "$apash_ioArrayName" "apash_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  # Set the default value to the last index + 1
  apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_ioArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  [ -z "$apash_inEndIndex" ] && apash_inEndIndex=$((apash_lastIndex+1))

  NumberUtils.isLong "$apash_inOffset"     || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  NumberUtils.isLong "$apash_inStartIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  NumberUtils.isLong "$apash_inEndIndex"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  [[ $apash_inStartIndex -ge $apash_lastIndex ]]               && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  [[ $apash_inEndIndex   -le $APASH_ARRAY_FIRST_INDEX ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  [[ $apash_inStartIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inStartIndex=$APASH_ARRAY_FIRST_INDEX
  [[ $apash_inEndIndex   -gt $apash_lastIndex ]] && apash_inEndIndex=$((apash_lastIndex+1))
  
  apash_distance=$((apash_inEndIndex - apash_inStartIndex))
  [[ $apash_distance -le 1 ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  apash_inOffset=$((apash_inOffset%(apash_distance)))
    
  while [[ $apash_distance -gt 1 && $apash_inOffset -gt 0 ]]; do
    apash_distance_offset=$((apash_distance - apash_inOffset))

    if [[ $apash_inOffset -gt $apash_distance_offset ]]; then
      ArrayUtils.swap "apash_outArray" "$apash_inStartIndex" $((apash_inStartIndex + apash_distance - apash_distance_offset)) $apash_distance_offset
      apash_distance=$apash_inOffset
      apash_inOffset=$((apash_inOffset - apash_distance_offset))
    elif [[ $apash_inOffset -lt  $apash_distance_offset ]]; then
      ArrayUtils.swap "apash_outArray" "$apash_inStartIndex" $((apash_inStartIndex + apash_distance_offset)) $apash_inOffset
      apash_inStartIndex=$((apash_inStartIndex + apash_inOffset))
      apash_distance=$apash_distance_offset
    else
      ArrayUtils.swap "apash_outArray" "$apash_inStartIndex" $((apash_inStartIndex + apash_distance_offset)) $apash_inOffset
      break;
    fi
  done

  ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
