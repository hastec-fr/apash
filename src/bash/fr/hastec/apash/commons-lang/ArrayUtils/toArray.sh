#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.toArray
# @brief Create an array based on list of arguments
#
# @description
# The toArray is stopped at the end of the array and as many as possible elements are toArrayped.
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
#    myArray=()
#    ArrayUtils.toArray    "myArray"                   # ()
#    ArrayUtils.toArray    "myArray"  "2"              # (2)
#    ArrayUtils.toArray    "myArray"  "a" "b" "c" "d"  # ("a" "b" "c" "d")
#    ArrayUtils.toArray    "myArray"  "a" "2" "b"      # ("a" "2" "b")
# ```
#
# @arg $1 ref(string[]) Name of the array to toArray. [Default: N/A]
# @arg $2 string... Elements to add to the array [Default: N/A]
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When list of argument are pushed to the array.
# @exitcode 1 When the input is not an array.
ArrayUtils.toArray() {
  local ioArrayRef="$1"
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"
  local -n inArray="$ioArrayRef"
  shift

  # shellcheck disable=SC2034
  inArray=("$@")

  return "$APASH_FUNCTION_SUCCESS"
}