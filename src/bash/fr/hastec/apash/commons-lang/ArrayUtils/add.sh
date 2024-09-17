#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.add
# @brief Adds a given element at the end of an array.
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
#    ArrayUtils.add  ""       ""            # failure
#    ArrayUtils.add  "myVar"  "a"           # failure
#
#    declare -A myMap
#    ArrayUtils.add  "myMap"  "a"           # failure
#
#    myArray=()
#    ArrayUtils.add  "myArray"              # failure
#    ArrayUtils.add  "myArray"  "a"         # ("a")
#    ArrayUtils.add  "myArray"  "b"         # ("a" "b")
#    ArrayUtils.add  "myArray"  ""          # ("a" "b" "")
#    ArrayUtils.add  "myArray"  "foo bar"   # ("a" "b" "" "foo bar")
#    ArrayUtils.add  "myArray"  "c" "d"     # failure
# ```
#
# @arg $1 ref(string[]) Name of the array to modify.
# @arg $2 string Value to add at the end of the array.
#
# @stdout None
# @stderr None.
#
# @see For adding element in the middle of an array, please check insert method.
# @exitcode 0 When first argument is an array and the value is not an embedded array or map.
# @exitcode 1 Otherwise.
ArrayUtils.add() {
  local ioArrayRef="$1"
  local -n inArray="$ioArrayRef" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  local inValue="$2"
  [ $# -ne 2 ] && return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"
  
  inArray+=("$inValue") && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}