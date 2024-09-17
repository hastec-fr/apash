#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.contains

# File description ###########################################################
# @name ArrayUtils.removeDuplicates
# @brief Removes elements which are present multiple times in the array.
#
# @description
# All remaining elements are shifted to the left.
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
#    myArray=("a" "b" "a" "c")
#    ArrayUtils.removeDuplicates  "myArray"    # ("a" "b" "c")
#
#    myArray=()
#    ArrayUtils.removeDuplicates  "myArray"    # ()
#
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.removeDuplicates  "myArray"    # ("a" "b" "c" "d")
# ```
#
# @arg $1 ref(string[]) Name of the array to modify.
#
# @stdout None
# @stderr None.
#
# @exitcode 0 When first argument is an array.
# @exitcode 1 Otherwise.
ArrayUtils.removeDuplicates() {
  local ioArrayRef="$1"
  local -n inArray="$ioArrayRef" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"

  for value in "${inArray[@]}"; do
    echo "ICI: $value"
  done

  local uniqueArray=()
  for value in "${inArray[@]}"; do
    ArrayUtils.contains "uniqueArray" "$value" || uniqueArray+=("$value") 
  done

  inArray=("${uniqueArray[@]}")
  return "$APASH_FUNCTION_SUCCESS"
}