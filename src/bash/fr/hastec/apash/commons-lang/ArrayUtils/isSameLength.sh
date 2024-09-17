#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.isSameLength
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
#    ArrayUtils.isSameLength ""        ""         # false
#    ArrayUtils.isSameLength "myVar"   "myVar"    # false
#
#    declare -A myMap
#    ArrayUtils.isSameLength "myMap"    "myMap    # false
#
#    myArray=()
#    ArrayUtils.isSameLength "myArray"  "myArray" # true
#    ArrayUtils.isSameLength "myArray"  ""        # false
#
#    myArray1=("a")
#    myArray2=("b")
#    ArrayUtils.isSameLength "myArray1" "myArray2" # true
#
#    myArray1=("a")
#    myArray2=("a" "b")
#    ArrayUtils.isSameLength "myArray"  "myArray2" # false
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
ArrayUtils.isSameLength() {
  local inArrayRef1="$1"
  local inArrayRef2="$2"
  local -n inArray1="$inArrayRef1" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  local -n inArray2="$inArrayRef2" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  ArrayUtils.isArray "$inArrayRef1" || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$inArrayRef2" || return "$APASH_FUNCTION_FAILURE"
  [[ ${#inArray1[@]} -ne ${#inArray2[@]} ]] && return "$APASH_FUNCTION_FAILURE"
  return "$APASH_FUNCTION_SUCCESS"
}