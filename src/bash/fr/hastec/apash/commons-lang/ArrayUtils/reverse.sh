#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.NumberUtils.isInteger

# File description ###########################################################
# @name ArrayUtils.reverse
# @brief Reverses the order of the given array in the given range.
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
#    ArrayUtils.reverse  "myVar"           # failure - ""
#    ArrayUtils.reverse  "myArray"         # failure - ""
#    ArrayUtils.reverse  "myArray"         # ("d" "" "c" "b" "a")
#
#    myArray=("a")
#    ArrayUtils.reverse  "myArray"  "a"       # ("a")
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.reverse  "myVar" "2"       #  myArray=("a" "b" "d" "" "c")
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.reverse  "myVar" "1" "4"   #  myArray=("a" "" "c" "b" "d")
#
# ```
#
# @arg $1 ref(string[]) Name of the array to reverse.
# @arg $2 number The starting inclusive index for reversing. Undervalue (<0) is promoted to 0, overvalue (>array.length) results in no change. [Default:0]
# @arg $3 number The ending exclusive index (up to endIndex-1) for reversing. Undervalue (< start index) results in no change. Overvalue (>array.length) is demoted to array length. [Default: ${#Array.length}]
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is reversed.
# @exitcode 1 When the input is not an array or the indexes are not integers.
ArrayUtils.reverse() {
  local ioArrayRef="$1"
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"
  local -n inArray="$ioArrayRef"
  local inStartIndex="${2:-0}"
  local inEndIndex="${3:-$((${#inArray[@]}))}"
  local swap=""

  NumberUtils.isInteger "$inStartIndex" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isInteger "$inEndIndex"   || return "$APASH_FUNCTION_FAILURE"

  [[ "$inStartIndex" -ge ${#inArray[@]}-1 ]] && return "$APASH_FUNCTION_SUCCESS"
  [[ "$inEndIndex"   -le 0 ]] && return "$APASH_FUNCTION_SUCCESS"

  [[ "$inStartIndex" -lt 0 ]] && inStartIndex=0
  [[ "$inEndIndex"   -gt ${#inArray[@]} ]] && inEndIndex=${#inArray[@]}
  
  [[ "$inStartIndex" -ge "$inEndIndex" ]] && return "$APASH_FUNCTION_SUCCESS"
    
  while [[ $inStartIndex -lt $inEndIndex ]]; do
    swap=${inArray[$inStartIndex]}
    inArray["$inStartIndex"]=${inArray["$((inEndIndex - 1))"]}
    inArray["$((inEndIndex - 1))"]="$swap"
    inStartIndex=$((inStartIndex + 1))
    inEndIndex=$((inEndIndex - 1))
  done

  return "$APASH_FUNCTION_SUCCESS"
}