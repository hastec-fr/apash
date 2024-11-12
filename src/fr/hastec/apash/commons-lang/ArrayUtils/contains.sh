#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
[ "$APASH_SHELL" = "zsh" ] && apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

# File description ###########################################################
# @name ArrayUtils.contains
# @brief Adds given elements at the end of an array.
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
# | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
# | $2     | inValue        | string        | in       |            | Value to find in the array.          |
#
# #### Example
# ```bash
#    ArrayUtils.contains  ""       ""            # false
#    ArrayUtils.contains  "myVar"  "a"           # false
#
#    declare -A myMap
#    ArrayUtils.contains  "myMap"  "a"           # false
#
#    myArray=("a" "b" "" "c")
#    ArrayUtils.contains  "myArray"              # false
#    ArrayUtils.contains  "myArray"  "d"         # false
#    ArrayUtils.contains  "myArray"  ""          # true
#    ArrayUtils.contains  "myArray"  "b"         # true
#    ArrayUtils.contains  "myArray"  "a b"       # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When first argument is an array and a value to find is provided.
# @exitcode 1 Otherwise.
ArrayUtils.contains() {
  [ $# -ne 2 ] && return "$APASH_FUNCTION_FAILURE"

  local inArrayName="$1"
  local inValue="$2"
  local value=""
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"

  if [ "$APASH_SHELL" = "zsh" ]; then
    local inArray=()
    ArrayUtils.clone "$inArrayName" inArray || return "$APASH_FUNCTION_FAILURE"
  else
    # shellcheck disable=SC2178
    local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
  fi 
  
  for value in "${inArray[@]}"; do
    [[ "$value" == "$inValue" ]] && return "$APASH_FUNCTION_SUCCESS"
  done
  return "$APASH_FUNCTION_FAILURE"
}