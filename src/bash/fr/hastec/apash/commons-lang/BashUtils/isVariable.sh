#!/usr/bin/env bash

# File description ###########################################################
# @name BashUtils.isVariableNameValid
# @brief Defensive programming technique to check that a variable exists.
#
# @description
#   Arrays and Maps will are not considered here as variables.
#   If you need to consider arrays and maps then use BashUtils.isDeclared.
# 
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Example
# ```bash
#    BashUtils.isVariable  ""              # false
#    BashUtils.isVariable  "myVar"         # false
#
#    myVar=myValue
#    BashUtils.isVariable  "myVar"         # true
#
#    declare -a myArray=()
#    BashUtils.isVariable  "myArray"       # false
#
#    declare -A myMap=([foo]=bar)
#    BashUtils.isVariable  "myMap"         # false
#
# ```
#
# @arg $1 string Variable name to check
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input name corresponds to a variable (not including arrays and maps).
# @exitcode 1 Otherwise.
BashUtils.isVariable() {
  local varName="$1"
  declare -p "$varName" 2> /dev/null | grep -q 'declare --' && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}