#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.getLength
# @brief Returns the length of the specified array.
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
#    ArrayUtils.getLength  ""             # failure - ""
#    ArrayUtils.getLength  "myVar"        # failure - ""
#
#    declare -A myMap
#    ArrayUtils.getLength  "myMap"        # failure - ""
#
#    myArray=("a" "b" "" "c")
#    ArrayUtils.getLength  "myArray"      # "4"
#
#    myArray=()
#    ArrayUtils.getLength  "myArray"      # "0"
# ```
#
# @arg $1 ref(string[]) Name of the array to get length.
#
# @stdout The length of the array, or empty if it's not an array or does not exists.
# @stderr None.
#
# @exitcode 0 When input array reference exists.
# @exitcode 1 Otherwise.
ArrayUtils.getLength() {
  local inArrayName="$1"
  local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"

  echo "${#inArray[@]}" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}