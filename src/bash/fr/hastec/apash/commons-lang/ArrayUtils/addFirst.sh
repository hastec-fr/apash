#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty

# File description ###########################################################
# @name ArrayUtils.addFirst
# @brief Adds given elements at the beginning of an array.
#
# @description
#   Non array reference will be transformed to empty array.
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
#    ArrayUtils.addFirst  ""       ""          # failure
#    ArrayUtils.addFirst  "myVar"  "a"         # ("a")
#
#    declare -A myMap
#    ArrayUtils.addFirst  "myMap"  "a"         # ("a")
#
#    myArray=()
#    ArrayUtils.addFirst  "myArray"              # failure
#    ArrayUtils.addFirst  "myArray"  "a"         # ("a")
#    ArrayUtils.addFirst  "myArray"  "b"         # ("b" "a")
#    ArrayUtils.addFirst  "myArray"  ""          # ("" "a" "b")
#    ArrayUtils.addFirst  "myArray"  "c" "d"     # failure
#    ArrayUtils.addFirst  "myArray"  "foo bar"   # ("foo bar" "" "b" "a")
# ```
#
# @arg $1 ref(string[]) Name of the array to modify.
# @arg $2 string Value to add at the beginning of the array.
#
# @stdout None
# @stderr None.
#
# @see For adding element in the middle of an array, please check insert method.
# @exitcode 0 When first argument is an array and a value must be added.
# @exitcode 1 When none or more than 1 value must be added.
ArrayUtils.addFirst() {
  local inArrayName="$1"
  ArrayUtils.nullToEmpty "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  local -n inArray="$inArrayName"
  local inValue="$2"

  [ $# -ne 2 ] && return "$APASH_FUNCTION_FAILURE"
  
  inArray=("$inValue" "${inArray[@]}")
  return "$APASH_FUNCTION_SUCCESS"
}