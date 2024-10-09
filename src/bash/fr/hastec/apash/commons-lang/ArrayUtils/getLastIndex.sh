#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.getLastIndex
# @brief Return the last index of the given array.
# @description
#   Empty string is returned if the array is empty.
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
#
# #### Example
# ```bash
#    myIndexes=()
#    ArrayUtils.getLastIndex  ""               # failure - ""
#    ArrayUtils.getLastIndex  "myVar"          # failure - ""
#
#    declare -A myMap
#    ArrayUtils.getLastIndex  "myMap"          # failure - ""
#
#    myArray=()
#    ArrayUtils.getLastIndex  "myArray"        # ""
#
#    myArray=("a" "b" "" "c" "b")
#    ArrayUtils.getLastIndex  "myArray"        # 4
#
#    myArray[9223372036854775807]=z
#    ArrayUtils.getLastIndex  "myArray"        # 9223372036854775807
#   
#  ```
#
# @stdout The last index of the array.
# @stderr None.
#
# @exitcode 0 When input array references exist.
# @exitcode 1 Otherwise.
ArrayUtils.getLastIndex() {
  local inArrayName="$1"
  local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  echo "${!inArray[@]}" | awk '{print $NF}' && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}