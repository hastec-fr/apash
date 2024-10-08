#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndexValid
apash.import fr.hastec.apash.commons-lang.ArrayUtils.remove
apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeDuplicates
apash.import fr.hastec.apash.util.Array.sort

# File description ###########################################################
# @name ArrayUtils.removeAll
# @brief Removes the elements at the specified positions from the specified array.
#
# @description
#   All remaining elements are shifted to the left.
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
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array to modify.        |
# | ${@:2} | inIndexes      | numbers...    | in       |            |  The indexes of the array to remove. |
#
# #### Example
# ```bash
#    ArrayUtils.removeAll  ""       ""          # failure
#    ArrayUtils.removeAll  "myVar"  "0"         # failure
#
#    declare -A myMap
#    ArrayUtils.removeAll  "myMap"  "0"         # failure
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.removeAll  "myArray"            # failure
#    ArrayUtils.removeAll  "myArray"  "4"       # ("a" "b" "c" "")
#    ArrayUtils.removeAll  "myArray"  "0" "2"   # ("b" "")
#    ArrayUtils.removeAll  "myArray"  "-1"      # failure - ("b" "")
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.removeAll  "myArray"  "1" "1"   # ("a" "c" "" "d")
#
#    myArray=("a")
#    ArrayUtils.removeAll  "myArray"  "4"       # failure - (a)
#    ArrayUtils.removeAll  "myArray"  "0"       # ()
#    ArrayUtils.removeAll  "myArray"  "0"       # failure - ()
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When first argument is an array and all indexes are valid numbers.
# @exitcode 1 Otherwise.
ArrayUtils.removeAll() {
  local ioArrayRef="$1"
  local indexes=()
  local index=""
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"
  shift

  [ $# -eq 0 ] && return "$APASH_FUNCTION_FAILURE"
  
  for index in "$@"; do
    ArrayUtils.isArrayIndexValid "$ioArrayRef" "$index"  || return "$APASH_FUNCTION_FAILURE"
    indexes+=("$index")
  done
  
  ArrayUtils.removeDuplicates "indexes" || return "$APASH_FUNCTION_FAILURE"
  Array.sort "indexes" || return "$APASH_FUNCTION_FAILURE"
    
  # @todo: operation on array could fail in the middle. It must be handled.
  for ((i=${#indexes[@]}-1; i >= 0; i--)); do
    ArrayUtils.remove "$ioArrayRef" "${indexes[i]}" || return "$APASH_FUNCTION_FAILURE"
  done

  return "$APASH_FUNCTION_SUCCESS"
}