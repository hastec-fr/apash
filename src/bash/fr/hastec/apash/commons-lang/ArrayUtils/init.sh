#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariable
apash.import fr.hastec.apash.commons-lang.MapUtils.isMap

# File description ###########################################################
# @name ArrayUtils.init
# @brief Defensive programming technique initialize an array.
# @description
#   The array is created if the variable is not declared.
#   If it was an array, then reinitialize it.
#   If it's an existing variable or map, just fail to protect overriding.
#
# ### Since:
# 0.2.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | in       |            | Name of the array to initialize.     |
#
# @description
# #### Example
# ```bash
#    
#    myVar="test" 
#    ArrayUtils.init  "myVar"           # failure
#
#    declare -A myMap=([foo]=bar)
#    ArrayUtils.init  "myVar"           # failure
#
#    ArrayUtils.init  "myArray"         # myArray=()
#
#    myArray=()
#    ArrayUtils.init  "myArray"         # myArray=()
#
#    myArray=("a" "b" "c")
#    ArrayUtils.init  "myArray"         # myArray=()
# ```
#
# @see [nullToEmpty](./nullToEmpty.md), [anythingToEmpty](./anythingToEmpty.md)
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
ArrayUtils.init() {
  local ioArrayName="$1"
  BashUtils.isVariableNameValid "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  BashUtils.isVariable "$ioArrayName" && return "$APASH_FUNCTION_FAILURE"
  MapUtils.isMap "$ioArrayName" && return "$APASH_FUNCTION_FAILURE"

  unset "$ioArrayName"
  declare -a "$ioArrayName" && return "$APASH_FUNCTION_SUCCESS"
  # (( "${ioArrayName}[0]=1" )) || return "$APASH_FUNCTION_FAILURE"
  # local -n outArrayRef="${ioArrayName}"
  # # shellcheck disable=SC2034
  # outArrayRef=() && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
