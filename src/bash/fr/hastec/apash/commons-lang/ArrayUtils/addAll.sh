#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex

# File description ###########################################################
# @name ArrayUtils.addAll
# @brief Adds given elements at the end of an array.
#
# @description
#   Non array reference will be transformed to empty array.
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
#    ArrayUtils.addAll  ""       ""            # failure
#    ArrayUtils.addAll  "myVar"  "a"           # ("a")
#
#    declare -A myMap
#    ArrayUtils.addAll  "myMap"  "a"           # ("a")
#
#    myArray=()
#    ArrayUtils.addAll  "myArray"              # failure
#    ArrayUtils.addAll  "myArray"  "a"         # ("a")
#    ArrayUtils.addAll  "myArray"  "b" ""      # ("a" "b" "")
#    ArrayUtils.addAll  "myArray"  "c" "d"     # ("a" "b" "" "c" "d")
#    ArrayUtils.addAll  "myArray"  "foo bar"   # ("a" "b" "" "c" "d" "foo bar")
# ```
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
ArrayUtils.addAll() {
  local inArrayName="$1"
  ArrayUtils.nullToEmpty "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  local -n inArray="$inArrayName"

  shift
  [ $# -eq 0 ] && return "$APASH_FUNCTION_FAILURE"

  # Return failure if the number of element exceed the bounds.
  ArrayUtils.isArrayIndex $((${#inArray} + $# - 1)) ||  return "$APASH_FUNCTION_FAILURE"

  for inValue in "$@"; do
    inArray+=("$inValue") ||  return "$APASH_FUNCTION_FAILURE"
  done
  return "$APASH_FUNCTION_SUCCESS"
}