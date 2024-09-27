#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.contains
# @brief Adds given elements at the end of an array.
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
# @arg $1 ref(string[]) Name of the array to check.
# @arg $2 string Value to find in the array.
#
# @stdout None
# @stderr None.
#
# @exitcode 0 When first argument is an array and a value to find is provided.
# @exitcode 1 Otherwise.
ArrayUtils.contains() {
  local inArrayName="$1"
  local inValue="$2"
  local value=""
  local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"    
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  [ $# -ne 2 ] && return "$APASH_FUNCTION_FAILURE"
  for value in "${inArray[@]}"; do
    [[ "$value" == "$inValue" ]] && return "$APASH_FUNCTION_SUCCESS"
  done
  return "$APASH_FUNCTION_FAILURE"
}