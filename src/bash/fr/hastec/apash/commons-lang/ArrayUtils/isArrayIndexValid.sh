#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.NumberUtils.isDigits

# File description ###########################################################
# @name ArrayUtils.isArrayIndexValid
# @brief Returns whether a given array can safely be accessed at the given index.
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
# | $1     | inArrayName    | ref(string[]) | in       |            | The array to inspect                 |
# | $2     | inIndex        | number        | in       |            | The index of the array to be inspected.  |
#
# #### Example
# ```bash
#    ArrayUtils.isArrayIndexValid ""       ""     # false
#    ArrayUtils.isArrayIndexValid "myVar"  "a"    # false
#
#    declare -A myMap
#    ArrayUtils.isArrayIndexValid "myMap"  "a"    # false
#
#    myArray=("a" "b" "" "c" "b")
#    ArrayUtils.isArrayIndexValid "myArray" "1"                  # true
#    ArrayUtils.isArrayIndexValid "myArray" "${#myArray}"        # false
#    ArrayUtils.isArrayIndexValid "myArray" "$((${#myArray}-1))" # true
#    ArrayUtils.isArrayIndexValid "myArray" "-1"                 # false
#    ArrayUtils.isArrayIndexValid "myArray" "5"                  # false
#    ArrayUtils.isArrayIndexValid "myArray"                      # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 Whether the given index is safely-accessible in the given array.
# @exitcode 1 Otherwise.
ArrayUtils.isArrayIndexValid() {
  local inArrayName="$1"
  local inIndex="$2"
  local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isDigits "$inIndex" || return "$APASH_FUNCTION_FAILURE"
  [[ $inIndex -ge ${#inArray[@]} ]] && return "$APASH_FUNCTION_FAILURE"
  return "$APASH_FUNCTION_SUCCESS"
}