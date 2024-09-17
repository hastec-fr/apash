#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.clone
# @brief Copy an array into another array using references.
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
# @example
#    ArrayUtils.clone  ""       ""               # failure
#
#    declare -A myMap
#    ArrayUtils.addFirst  "myMap"  "a"           # failure
#
#    declare -a myClone
#    ArrayUtils.clone  "myVar"  "myClone"        # failure
#
#    myArray=()
#    myClone=("a")
#    ArrayUtils.clone     "myArray"  "myClone"   # myClone=()
#    
#    myArray=("a" "b" "" "c")
#    myClone=("d" "e" "f")
#    ArrayUtils.clone     "myArray"  "myClone"   # myClone=("a" "b" "" "c")
#
#    myArray=("a" "b" "" "c")
#    myClone=()
#    ArrayUtils.clone     "myArray"  "myClone"   # myClone=("a" "b" "" "c")
#
# @arg $1 ref(string[]) Name of the array to modify.
# @arg $2 ref(string[]) Name of the array which will receive the clone 
#
# @stdout None
# @stderr None.
#
# @exitcode 0 When input arguments are arrays.
# @exitcode 1 Otherwise.
ArrayUtils.clone() {
  local inArrayRef1="$1"
  local inArrayRef2="$2"
  local -n inArray1="$inArrayRef1" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
  local -n inArray2="$inArrayRef2" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
  
  ArrayUtils.isArray "$inArrayRef1" || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$inArrayRef2" || return "$APASH_FUNCTION_FAILURE"  
  
  inArray2=("${inArray1[@]}")
  return "$APASH_FUNCTION_SUCCESS"
}