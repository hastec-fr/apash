#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.getLength
# @brief Returns the length of the specified array.
#
# @description
#   Take care that the length of an array does not correspond to its last index.
#   Array indexes are set to Long_MAX_VALUE (9223372036854775807).
#   Setting this value does not mean that the length is 9223372036854775807.
#   If you need the last index, prefer the usage of ArrayUtils.getLastIndex.
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
# <!-- apash.parentEnd -->
#
#
# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to get length.     |
#
# #### Example
# ```bash
#    ArrayUtils.getLength  ""             # failure - ""
#    ArrayUtils.getLength  "myVar"        # failure - ""
#
#    declare -A myMap
#    ArrayUtils.getLength  "myMap"        # failure - ""
#
#    myArray=("a" "b" "" "c")
#    ArrayUtils.getLength  "myArray"      # 4
#
#    myArray[9223372036854775807]=z
#    ArrayUtils.getLength  "myArray"      # 5 ([0]="a" [1]="b" [2]="" [3]="c" [9223372036854775807]="z")
#
#    myArray=()
#    ArrayUtils.getLength  "myArray"      # 0
# ```
#
# @stdout The length of the array, or empty if it's not an array or does not exists.
# @stderr None.
#
# @exitcode 0 When input array reference exists.
# @exitcode 1 Otherwise.
#
# @see [ArrayUtils.getLastIndex](./getLastIndex.md)
ArrayUtils.getLength() {
  local inArrayName="$1"
  local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"

  echo "${#inArray[@]}" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}