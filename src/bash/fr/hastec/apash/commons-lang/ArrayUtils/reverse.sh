#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

# File description ###########################################################
# @name ArrayUtils.reverse
# @brief Reverses the order of the given array in the given range.
# @description
# This method does nothing for non existing array.
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
# | $1     | ioArrayName    | ref(string[]) | in       |                 |  Name of the array to reverse.       |
# | $2 ?   | inStartIndex   | number        | in       | 0               |  The starting inclusive index for reversing. Undervalue (<0) is promoted to 0, overvalue (>array.length) results in no change. |
# | $3 ?   | inEndIndex     | number        | in       | ${#1[@]} length |  The ending exclusive index (up to endIndex-1) for reversing. Undervalue (< start index) results in no change. Overvalue (>array.length) is demoted to array length. |
#
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

  NumberUtils.isLong "$inStartIndex" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inEndIndex"   || return "$APASH_FUNCTION_FAILURE"

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