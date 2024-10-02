#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

# File description ###########################################################
# @name ArrayUtils.isSameLastIndex
# @brief Checks whether two arrays are the same length, return false if it's not an array.
#
#
# @description
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
#    ArrayUtils.isSameLastIndex ""        ""          # false
#    ArrayUtils.isSameLastIndex "myVar"   "myVar"     # false
#
#    declare -A myMap
#    ArrayUtils.isSameLastIndex "myMap"    "myMap     # false
#
#    myArray=()
#    ArrayUtils.isSameLastIndex "myArray"  "myArray"  # true
#    ArrayUtils.isSameLastIndex "myArray"  ""         # false
#
#    myArray1=("a")
#    myArray2=("b")
#    ArrayUtils.isSameLastIndex "myArray1" "myArray2" # true
#
#    myArray1=("a")
#    myArray2=("a" "b")
#    ArrayUtils.isSameLastIndex "myArray"  "myArray2" # false
#
#    myArray1=("a")
#    myArray2=("a" "b")
#    myArray1[10]=z
#    ArrayUtils.isSameLength "myArray"  "myArray2"    # false
# ```
#
# @arg $1 ref(string[]) The first array to compare.
# @arg $2 ref(string[]) The second array to compare.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 True if length of arrays matches.
# @exitcode 1 Otherwise.
ArrayUtils.isSameLastIndex() {
  local inArrayRef1="$1"
  local inArrayRef2="$2"
  local lastIndex1
  local lastIndex2
  lastIndex1=$(ArrayUtils.getLastIndex "$inArrayRef1") || return "$APASH_FUNCTION_FAILURE"
  lastIndex2=$(ArrayUtils.getLastIndex "$inArrayRef2") || return "$APASH_FUNCTION_FAILURE"
  [[ $lastIndex1 -ne $lastIndex2 ]] && return "$APASH_FUNCTION_FAILURE"
  return "$APASH_FUNCTION_SUCCESS"
}