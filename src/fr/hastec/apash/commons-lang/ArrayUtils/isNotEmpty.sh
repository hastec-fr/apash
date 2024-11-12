#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

# File description ###########################################################
# @name ArrayUtils.isNotEmpty
# @brief Checks if an array exist and has at least one element.
# @description
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
# | $1     | inArrayName    | ref(string[]) | in       |            | The array to check.                  |
#
# #### Example
# ```bash
#    ArrayUtils.isNotEmpty ""              # false
#    ArrayUtils.isNotEmpty "myVar"         # false
#
#    declare -A myMap
#    ArrayUtils.isNotEmpty "myMap"         # false
#
#    myArray=()
#    ArrayUtils.isNotEmpty "myArray"       # false
#
#    myArray=("a")
#    ArrayUtils.isNotEmpty "myArray"       # true 
#
#    myArray=("")
#    ArrayUtils.isNotEmpty "myArray"       # true 
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 Whether the given array has at least one element.
# @exitcode 1 Otherwise.
ArrayUtils.isNotEmpty() {
  local inArrayName="$1"
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"

  if [[ $APASH_SHELL == "zsh" ]]; then
    [[ ${#${(P)inArrayName}[@]} -eq 0 ]] && return "$APASH_FUNCTION_FAILURE"
  else
    local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
    [[ ${#inArray[@]} -eq 0 ]] && return "$APASH_FUNCTION_FAILURE"
  fi
  
  return "$APASH_FUNCTION_SUCCESS"
}