#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.sh
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong


# File description ###########################################################
# @name ArrayUtils.lastIndexOf
# @brief Finds the last index of the given value in the array starting at the given index.
# @description
#   A negative startIndex is treated as zero. A startIndex larger than the array length will return an empty
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
# | $1     | inArrayName    | ref(string[]) | in       |            |  Name of the array to check.         |
# | $2     | inValue        | string        | in       |            |  Value to find.                      |
# | $3 ?   | inStart        | number        | in       | 0          |  The index to start searching at .   |
#
# #### Example
# ```bash
#    myIndexes=()
#    ArrayUtils.lastIndexOf  ""       ""         # failure - ""
#    ArrayUtils.lastIndexOf  "myVar"  "a"        # failure - ""
#
#    declare -A myMap
#    ArrayUtils.lastIndexOf  "myMap"  "a"        # failure - ""
#
#    myArray=("a" "b" "" "c" "b")
#    ArrayUtils.lastIndexOf  "myArray" "b"       # ("4")
#    ArrayUtils.lastIndexOf  "myArray" ""        # ("2")
#    ArrayUtils.lastIndexOf  "myArray"           # failure - ""
#
#    myIndexes=(1 2)
#    myArray=("a" "b")
#    ArrayUtils.lastIndexOf  "myArray" "c"       # -1
#    ArrayUtils.lastIndexOf  "myArray" "a" "3"   # -1
#    ArrayUtils.lastIndexOf  "myArray" "a" "-1"  # 0
#    ArrayUtils.lastIndexOf  "myArray" ""        # -1
#  ```
#
# @stdout The last index of the value within the array, ArrayUtils_INDEX_NOT_FOUND (-1) if not found.
# @stderr None.
#
# @exitcode 0 When input array references exist and start index is an integer (when declared).
# @exitcode 1 Otherwise.
ArrayUtils.lastIndexOf() {
  local inArrayName="$1"
  local inValue="$2"
  local inStart="${3:-0}"
  local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inStart" || return "$APASH_FUNCTION_FAILURE"
  
  # If no value to find explicitly declared, then return
  [[ $# -lt 2 ]] && return "$APASH_FUNCTION_FAILURE"
  [[ $inStart -lt 0 ]] && inStart=0
  
  for ((i=${#inArray[@]}-1; i >= inStart  ; i--)); do
    [[ "${inArray[i]}" == "$inValue" ]] && echo "$i" && return "$APASH_FUNCTION_SUCCESS"
  done
  
  # Return default value if not found
  echo "$ArrayUtils_INDEX_NOT_FOUND"
  return "$APASH_FUNCTION_FAILURE"
}