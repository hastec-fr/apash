#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex

# File description ###########################################################
# @name ArrayUtils.addAll
# @brief Adds given elements at the end of an array.
#
# @description
#   The array is automatically created if the variable is not declared.
#   Existing variables or maps are not overriden and the function fails.
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
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | in & out |            | Name of the array to modify.          |
# | ${@:2} | inValues       | string...     | in       |            | Values to add at the end of the array.|
#
# #### Example
# ```bash
#    ArrayUtils.addAll  ""       ""            # failure
#    
#    myVar="test"
#    ArrayUtils.addAll  "myVar"  "a"           # failure
#
#    declare -A myMap
#    ArrayUtils.addAll  "myMap"  "a"           # failure
#
#    myArray=()
#    ArrayUtils.addAll  "myArray"              # failure
#    ArrayUtils.addAll  "myArray"  "a"         # ("a")
#    ArrayUtils.addAll  "myArray"  "b" ""      # ("a" "b" "")
#    ArrayUtils.addAll  "myArray"  "c" "d"     # ("a" "b" "" "c" "d")
#    ArrayUtils.addAll  "myArray"  "foo bar"   # ("a" "b" "" "c" "d" "foo bar")
# ```
#
# @stdout None.
# @stderr None.
#
# @see For adding element in the middle of an array, please check [insert](./insert.md) method.
#
# @exitcode 0 When first argument is an array and at least one value is provided.
# @exitcode 1 Otherwise.
ArrayUtils.addAll() {
  local ioArrayName="$1"
  ArrayUtils.nullToEmpty "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  local -n ioArray="$ioArrayName"
  shift
  [ $# -eq 0 ] && return "$APASH_FUNCTION_FAILURE"

  # Return failure if the number of elements exceed the bounds.
  ArrayUtils.isArrayIndex $((${#ioArray} + $# - 1)) ||  return "$APASH_FUNCTION_FAILURE"

  # Add values at the end of the array
  ioArray+=("$@")

  return "$APASH_FUNCTION_SUCCESS"
}