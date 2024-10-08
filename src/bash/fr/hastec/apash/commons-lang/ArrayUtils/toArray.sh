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
# #### Arguments
# | #      | varName        | Type          | in/out   | Default         | Description                          |
# |--------|----------------|---------------|----------|-----------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | out      |                 | Name of the array to toArray.        |
# | ${@:2} | inValues       | string...     | in       |                 | Elements to add to the array.        |
#
# #### Example
# ```bash
#    myArray=()
#    ArrayUtils.toArray    "myArray"                   # ()
#    ArrayUtils.toArray    "myArray"  "2"              # (2)
#    ArrayUtils.toArray    "myArray"  "a" "b" "c" "d"  # ("a" "b" "c" "d")
#    ArrayUtils.toArray    "myArray"  "a" "2" "b"      # ("a" "2" "b")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When list of argument are pushed to the array.
# @exitcode 1 When the input is not an array.
ArrayUtils.toArray() {
  local ioArrayName="$1"
  ArrayUtils.isArray "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  local -n ioArray="$ioArrayName"
  shift

  # shellcheck disable=SC2034
  ioArray=("$@")

  return "$APASH_FUNCTION_SUCCESS"
}