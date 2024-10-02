#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.swap
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

# File description ###########################################################
# @name ArrayUtils.shift
# @brief Shifts the order of a series of elements in the given array.
#
# @description
# This method does nothing for non existing array.
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
#
# ```
#
# @arg $1 ref(string[]) Name of the array to shift.
# @arg $2 number The number of positions to rotate the elements. If the offset is larger than the number of elements to rotate, than the effective offset is modulo the number of elements to rotate. [Default:0]
# @arg $3 number The starting inclusive index for reversing. Undervalue (<0) is promoted to 0, overvalue (>array.length) results in no change. [Default:0]
# @arg $4 number The ending exclusive index (up to endIndex-1) for reversing. Undervalue (< start index) results in no change. Overvalue (>array.length) is demoted to array length. [Default: ${#Array.length}]
#
# @stdout None.
# @stderr None.
#
# @see https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.6959
# @exitcode 0 When the array is shifted.
# @exitcode 1 When the input is not an array or the offset/indexes are not integers.
ArrayUtils.shift() {
  local ioArrayRef="$1"
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"
  local -n inArray="$ioArrayRef"
  local inOffset="${2:-0}"
  local inStartIndex="${3:-0}"
  local inEndIndex="${4:-${#inArray[@]}}"
  local distance=0
  local distance_offset=0

  NumberUtils.isLong "$inOffset"     || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inStartIndex" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inEndIndex"   || return "$APASH_FUNCTION_FAILURE"

  [[ "$inStartIndex" -ge ${#inArray[@]}-1 ]] && return "$APASH_FUNCTION_SUCCESS"
  [[ "$inEndIndex"   -le 0 ]] && return "$APASH_FUNCTION_SUCCESS"

  [[ "$inStartIndex" -lt 0 ]] && inStartIndex=0
  [[ "$inEndIndex"   -gt ${#inArray[@]} ]] && inEndIndex=${#inArray[@]}
  
  distance=$((inEndIndex - inStartIndex))
  [[ $distance -le 1 ]] && return "$APASH_FUNCTION_SUCCESS"

  inOffset=$((inOffset%(distance)))
    
  while [[ $distance -gt 1 && $inOffset -gt 0 ]]; do
    distance_offset=$((distance - inOffset))

    if [[ $inOffset -gt $distance_offset ]]; then
      ArrayUtils.swap "$ioArrayRef" "$inStartIndex" $((inStartIndex + distance - distance_offset)) $distance_offset
      distance=$inOffset
      inOffset=$((inOffset - distance_offset))
    elif [[ $inOffset -lt  $distance_offset ]]; then
      ArrayUtils.swap "$ioArrayRef" "$inStartIndex" $((inStartIndex + distance_offset)) $inOffset
      inStartIndex=$((inStartIndex + inOffset))
      distance=$distance_offset
    else
      ArrayUtils.swap "$ioArrayRef" "$inStartIndex" $((inStartIndex + distance_offset)) $inOffset
      break;
    fi
  done

  return "$APASH_FUNCTION_SUCCESS"
}