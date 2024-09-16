#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.addFirst
# @brief Adds given elements at the beginning of an array.
#
# @description
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [lang](../../lang.md) / [Math](../Math.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
#    ArrayUtils.addFirst  ""       ""          # failure
#    ArrayUtils.addFirst  "myVar"  "a"         # failure
#
#    declare -A myMap
#    ArrayUtils.addFirst  "myMap"  "a"         # failure
#
#    myArray=()
#    ArrayUtils.addFirst  "myArray"              # failure
#    ArrayUtils.addFirst  "myArray"  "a"         # ("a")
#    ArrayUtils.addFirst  "myArray"  "b"         # ("b" "a")
#    ArrayUtils.addFirst  "myArray"  ""          # ("" "a" "b")
#    ArrayUtils.addFirst  "myArray"  "c" "d"     # failure
#    ArrayUtils.addFirst  "myArray"  "foo bar"   # ("foo bar" "" "b" "a")
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
  local inArrayRef="$1"
  local -n inArray="$inArrayRef" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
  local inValue="$2"
  ArrayUtils.isArray "$inArrayRef" || return "$APASH_FUNCTION_FAILURE"
  [ $# -ne 2 ] && return "$APASH_FUNCTION_FAILURE"
  
  inArray=("$inValue" "${inArray[@]}")
  return "$APASH_FUNCTION_SUCCESS"
}