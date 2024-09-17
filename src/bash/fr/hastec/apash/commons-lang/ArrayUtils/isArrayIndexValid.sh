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
# [](../../../../.md) / [apash](../../../apash.md) / [lang](../../lang.md) / [Math](../Math.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
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
#
# @arg $1 ref(string[]) The array to inspect.
# @arg $2 number The index of the array to be inspected.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 Whether the given index is safely-accessible in the given array.
# @exitcode 1 Otherwise.
ArrayUtils.isArrayIndexValid() {
  local inArrayRef="$1"
  local inIndex="$2"
  local -n inArray="$inArrayRef" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  ArrayUtils.isArray "$inArrayRef" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isDigits "$inIndex" || return "$APASH_FUNCTION_FAILURE"
  [[ $inIndex -ge ${#inArray[@]} ]] && return "$APASH_FUNCTION_FAILURE"
  return "$APASH_FUNCTION_SUCCESS"
}