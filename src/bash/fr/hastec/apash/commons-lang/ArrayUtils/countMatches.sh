#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.countMathes
# @brief Return the number of cells having the given value
# @description
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
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
# | $2     | inValue        | string        | in       | ""         | Value to find in the array.          |
#
# #### Example
# ```bash
#    myArray=("a" "b" "" "a" "c" "" "")
#    ArrayUtils.countMathes  "myArray"              # 3
#    ArrayUtils.countMathes  "myArray"  "d"         # 0
#    ArrayUtils.countMathes  "myArray"  "b"         # 1
#    ArrayUtils.countMathes  "myArray"  "a"         # 2
# ```
#
# @stdout The number of cells having the given value.
# @stderr None.
#
# @exitcode 0 When first argument is an array.
# @exitcode 1 Otherwise.
ArrayUtils.countMatches() {
  local inArrayName="$1"
  local inValue="$2"
  local value
  local -i counter=0
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"

  if [ "$APASH_SHELL" = "zsh" ]; then
    for value in "${(P)inArrayName}"; do
      [[ "$value" == "$inValue" ]] && ((counter++))
    done
  else
    local -n inArray="$inArrayName"
    for value in "${inArray[@]}"; do
      [[ "$value" == "$inValue" ]] && ((counter++))
    done
  fi
  
  echo "$counter" && return "$APASH_FUNCTION_SUCCESS"
 
  return "$APASH_FUNCTION_FAILURE"
}