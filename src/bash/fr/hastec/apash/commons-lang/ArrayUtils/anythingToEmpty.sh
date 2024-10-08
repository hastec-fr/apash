#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid

# File description ###########################################################
# @name ArrayUtils.anythingToEmpty
# @brief Create an array even if the variable named was already declared.
#
# @description
#   The reference is transformed in any case in an empty array (even if it's a map or a variable).
#   Existing arrays are reinitialized.
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
# | $1     | ioArrayName    | ref(string[]) | in & out |            | Name of the array to create.         |
#
# #### Example
# ```bash
#    myVar="test"
#    ArrayUtils.anythingToEmpty  "myVar"           # myVar=()
#
#    declare -A myMap=([foo]=bar)
#    ArrayUtils.anythingToEmpty  "myMap"           # myMap=()
#
#    ArrayUtils.anythingToEmpty  "myArray"         # myArray=()
#
#    myArray=()
#    ArrayUtils.anythingToEmpty  "myArray"         # myArray=()
#
#    myArray=("a" "b" "c")
#    ArrayUtils.anythingToEmpty  "myArray"         # myArray=()
# ```
#
# @see [nullToEmpty](./nullToEmpty.md), [init](./init.md)
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 When the variable name is not valid.
ArrayUtils.anythingToEmpty() {
  local ioArrayName="$1"
  BashUtils.isVariableNameValid "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  unset "$ioArrayName"
  (( "${ioArrayName}[0]=1" )) || return "$APASH_FUNCTION_FAILURE"
  local -n outArrayRef="${ioArrayName}"
  # shellcheck disable=SC2034
  outArrayRef=() && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
