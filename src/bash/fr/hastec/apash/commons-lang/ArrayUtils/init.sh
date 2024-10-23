#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariable
apash.import fr.hastec.apash.commons-lang.BashUtils.isDeclared
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
# | $1     | ref_ArrayUtils_init_ioArrayName    | ref(string[]) | in       |            | Name of the array to initialize.     |
#
# @description
# #### Example
# ```bash
#    
#    myVar="test" 
#    ArrayUtils.init  "myVar"           # failure
#
#    declare -A myMap=([foo]=bar)
#    ArrayUtils.init  "myMap"           # failure
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
  local ref_ArrayUtils_init_ioArrayName="$1"
  BashUtils.isVariableNameValid "$ref_ArrayUtils_init_ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  BashUtils.isVariable "$ref_ArrayUtils_init_ioArrayName" && return "$APASH_FUNCTION_FAILURE"
  MapUtils.isMap "$ref_ArrayUtils_init_ioArrayName" && return "$APASH_FUNCTION_FAILURE"

  # If the variable is not declared, then create the corresponding global value.
  if ! BashUtils.isDeclared "$ref_ArrayUtils_init_ioArrayName"; then
    declare -g -a "$ref_ArrayUtils_init_ioArrayName" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  # Only way found in zsh to reset an existing array and preserving its original scope
  # P: pointer, A: consider the pointed value as array and provide an existing empty array.
  if [ "$APASH_SHELL" = "zsh" ]; then
    : ${(PA)ref_ArrayUtils_init_ioArrayName::=${ArrayUtils_EMPTY_ARRAY[@]}} && return "$APASH_FUNCTION_SUCCESS"
  else
    local -n ref_ArrayUtils_init_outArray="$ref_ArrayUtils_init_ioArrayName"
    ref_ArrayUtils_init_outArray=() && return "$APASH_FUNCTION_SUCCESS"
  fi
  return "$APASH_FUNCTION_FAILURE"
}
