#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeElement

# File description ###########################################################
# @name ArrayUtils.removeElements
# @brief Removes the first occurrence of the specified element from the specified array.
#
# @description
# All subsequent elements are shifted to the left (subtracts one from their indices). 
# If the array doesn't contains such an element, no elements are removed from the array.
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
#    myArray=("a" "b" "a" "c" "" "d")
#    ArrayUtils.removeElements  "myArray"            # failure
#    ArrayUtils.removeElements  "myArray"  "a"       # ("b" "a" "c" "" "d")
#    ArrayUtils.removeElements  "myArray"  "a"       # ("b" "c" "" "d")
#    ArrayUtils.removeElements  "myArray"  ""        # ("b" "c" "d")
#    ArrayUtils.removeElements  "myArray"  "e"       # ("b" "c" "d")
#
#    myArray=("a" "b" "a" "c" "" "d")
#    ArrayUtils.removeElements  "myArray"  "a" "a" "d"  # ("b" "c" "")
#
#    myArray=("a")
#    ArrayUtils.removeElements  "myArray"  "a"       # ()
#    ArrayUtils.removeElements  "myArray"  "a"       # ()
# ```
#
# @arg $1 ref(string[]) Name of the array to modify.
# @arg $2 string... List of first occurence of the value to remove from the array.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When all occurences have been removed from the array.
# @exitcode 1 Otherwise.
ArrayUtils.removeElements() {
  local ioArrayRef="$1"
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"
  [ $# -lt 2 ] && return "$APASH_FUNCTION_FAILURE"
  
  for value in "$@"; do
    ArrayUtils.removeElement "$ioArrayRef" "$value" || return "$APASH_FUNCTION_FAILURE"
  done

  return "$APASH_FUNCTION_SUCCESS"
}