#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.addAll
# @brief Adds given elements at the end of an array.
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
#    ArrayUtils.addAll  ""       ""          # failure
#    ArrayUtils.addAll  "myVar"  "a"         # failure
#
#    declare -A myMap
#    ArrayUtils.addAll  "myMap"  "a"         # failure
#
#    myArray=()
#    ArrayUtils.addAll  "myArray"              # failure
#    ArrayUtils.addAll  "myArray"  "a"         # ("a")
#    ArrayUtils.addAll  "myArray"  "b" ""      # ("a" "b" "")
#    ArrayUtils.addAll  "myArray"  "c" "d"     # ("a" "b" "" "c" "d")
#    ArrayUtils.addAll  "myArray"  "foo bar"   # ("a" "b" "" "c" "d" "foo bar")
#
# @arg $1 ref(string[]) Name of the array to modify.
# @arg $2 string... Values to add at the end of the array.
#
# @stdout None
# @stderr None.
#
# @see For adding element in the middle of an array, please check insert method.
# @exitcode 0 When first argument is an array and at least one value is provided.
# @exitcode 1 Otherwise.
ArrayUtils.addFirst() {
  local inArrayRef="$1"
  local -n inArray="$inArrayRef" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"    
  ArrayUtils.isArray "$inArrayRef" || return "$APASH_FUNCTION_FAILURE"
  [ $# -eq 1 ] && return "$APASH_FUNCTION_FAILURE"
  shift

  for inValue in "$@"; do
    inArray+=("$inValue") ||  return "$APASH_FUNCTION_FAILURE"
  done
  return "$APASH_FUNCTION_SUCCESS"
}