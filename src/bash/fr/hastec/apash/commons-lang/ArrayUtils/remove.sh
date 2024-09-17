#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndexValid

# File description ###########################################################
# @name ArrayUtils.remove
# @brief Removes the element at the specified position from the specified array.
#
# @description
# All subsequent elements are shifted to the left (subtracts one from their indices).
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
# @example
#    ArrayUtils.remove  ""       ""          # failure
#    ArrayUtils.remove  "myVar"  "a"         # failure
#
#    declare -A myMap
#    ArrayUtils.remove  "myMap"  "a"         # failure
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.remove  "myArray"            # failure
#    ArrayUtils.remove  "myArray"  "4"       # ("a" "b" "c" "")
#    ArrayUtils.remove  "myArray"  "2"       # ("a" "b" "")
#    ArrayUtils.remove  "myArray"  "0"       # ("b" "")
#    ArrayUtils.remove  "myArray"  "-1"      # failure - ("b" "")
#
#    myArray=("a")
#    ArrayUtils.remove  "myArray"  "4"       # failure - (a)
#    ArrayUtils.remove  "myArray"  "0"       # ()
#    ArrayUtils.remove  "myArray"  "0"       # failure - ()
#
# @arg $1 ref(string[]) Name of the array to modify.
# @arg $2 number The index of the array to remove.
#
# @stdout None
# @stderr None.
#
# @exitcode 0 When first argument is an array and the index is valid.
# @exitcode 1 Otherwise.
ArrayUtils.remove() {
  local ioArrayRef="$1"
  local -n inArray="$ioArrayRef" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  local inIndex="$2"
  [ $# -ne 2 ] && return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArrayIndexValid "$ioArrayRef" "$inIndex"  || return "$APASH_FUNCTION_FAILURE"
  
  inArray=("${inArray[@]:0:inIndex}" "${inArray[@]:inIndex+1}") && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}