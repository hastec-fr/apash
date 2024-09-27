#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid

# File description ###########################################################
# @name ArrayUtils.nullToEmpty
# @brief Defensive programming technique to change a null reference to an empty Array
#
# @description
#   The reference is transformed in any case in empty array.
#   Use the mathematic expression which accept dynamic name on left assignement 
#   to do the trick without using eval. Then flush the array.
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
#    ArrayUtils.nullToEmpty  ""                # failure
#    ArrayUtils.nullToEmpty  "myVar"           # myVar=()
#
#    declare -A myMap
#    ArrayUtils.nullToEmpty  "myMap"           # myVar=()
#
#    myArray=()
#    ArrayUtils.nullToEmpty  "myArray"         # myArray()
#
#    myArray=("a" "b" "c")
#    ArrayUtils.nullToEmpty  "myArray"  "a"    # myArray=("a" "b" "c")
# ```
#
# @arg $1 ref(string[]) Name of the array if exists.
#
# @stdout None
# @stderr None.
#
# @see For adding element in the middle of an array, please check insert method.
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
ArrayUtils.nullToEmpty() {
  # Return failure if 
  local inArrayName="$1"
  BashUtils.isVariableNameValid "$inArrayName" || return "$APASH_FUNCTION_FAILURE"  
  local -n ioArrayRef="$inArrayName" 2> /dev/null && ArrayUtils.isArray "$inArrayName" && return "$APASH_FUNCTION_SUCCESS"
  unset "$inArrayName"
  (( "${inArrayName}[0]=1" )) || return "$APASH_FUNCTION_FAILURE"
  local -n outArrayRef="${inArrayName}"
  outArrayRef=() && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
