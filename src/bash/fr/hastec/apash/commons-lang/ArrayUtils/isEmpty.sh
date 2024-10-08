#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.isEmpty
# @brief Checks if an array exist and is empty.
#
# @description
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
# | $1     | inArrayName    | ref(string[]) | in       |            | The array to check.                  |
#
# #### Example
# ```bash
#    ArrayUtils.isEmpty ""              # false
#    ArrayUtils.isEmpty "myVar"         # false
#
#    declare -A myMap
#    ArrayUtils.isEmpty "myMap"         # false
#
#    myArray=()
#    ArrayUtils.isEmpty "myArray"       # true
#
#    myArray=("a")
#    ArrayUtils.isEmpty "myArray"       # false
#
#    myArray=("")
#    ArrayUtils.isEmpty "myArray"       # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 Whether the given array has no element.
# @exitcode 1 Otherwise.
ArrayUtils.isEmpty() {
  local inArrayName="$1"
  local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  [[ ${#inArray[@]} -ne 0 ]] && return "$APASH_FUNCTION_FAILURE"
  return "$APASH_FUNCTION_SUCCESS"
}