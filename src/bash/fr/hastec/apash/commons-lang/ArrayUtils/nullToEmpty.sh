#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid
apash.import fr.hastec.apash.commons-lang.BashUtils.isDeclared

# File description ###########################################################
# @name ArrayUtils.nullToEmpty
# @brief Defensive programming technique to change a null reference to an empty Array
#
# @description
#   Only non referred variables are automatically transformed to emptyArray.
#   If array already exists, then nothing is done.
#
# ### Since:
# 0.1.0
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
# | $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array if exists.        |
#
# #### Example
# ```bash
#    ArrayUtils.nullToEmpty  ""                # failure
#
#    myVar=test
#    ArrayUtils.nullToEmpty  "myVar"           # failure
#
#    declare -A myMap
#    ArrayUtils.nullToEmpty  "myMap"           # failure
#
#    ArrayUtils.nullToEmpty  "myUndefVar"      # myUndefVar=()
#
#    myArray=()
#    ArrayUtils.nullToEmpty  "myArray"         # myArray=()
#
#    myArray=("a" "b" "c")
#    ArrayUtils.nullToEmpty  "myArray"  "a"    # myArray=("a" "b" "c")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
ArrayUtils.nullToEmpty() {
  local inArrayName="$1"
  BashUtils.isVariableNameValid "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$inArrayName" && return "$APASH_FUNCTION_SUCCESS"

  # Fails if the variable is declared and not an array
  BashUtils.isDeclared "$inArrayName" && return "$APASH_FUNCTION_FAILURE"

  # Declare the array with dynamic name
  declare -a "${inArrayName}" && return "$APASH_FUNCTION_SUCCESS"
  
  return "$APASH_FUNCTION_FAILURE"
}
