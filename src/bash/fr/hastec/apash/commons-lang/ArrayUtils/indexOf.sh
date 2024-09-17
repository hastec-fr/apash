#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.sh
apash.import fr.hastec.apash.commons-lang.NumberUtils.isInteger


# File description ###########################################################
# @name ArrayUtils.indexOf
# @brief Finds the first index of the given value in the array starting at the given index.
#
# @description
# A negative startIndex is treated as zero. A startIndex larger than the array length will return an empty
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
#    myIndexes=()
#    ArrayUtils.indexOf  ""       ""         # failure - ""
#    ArrayUtils.indexOf  "myVar"  "a"        # failure - ""
#
#    declare -A myMap
#    ArrayUtils.indexOf  "myMap"  "a"        # failure - ""
#
#    myArray=("a" "b" )
#    
#
#    myArray=("a" "b" "" "c" "b")
#    ArrayUtils.indexOf  "myArray" "b"       # ("1")
#    ArrayUtils.indexOf  "myArray" ""        # ("2")
#    ArrayUtils.indexOf  "myArray"           # failure - ""
#
#    myIndexes=(1 2)
#    myArray=("a" "b")
#    ArrayUtils.indexOf  "myArray" "c"       # -1
#    ArrayUtils.indexOf  "myArray" "a" "3"   # -1
#    ArrayUtils.indexOf  "myArray" "a" "-1"  # 0
#    ArrayUtils.indexOf  "myArray" ""        # -1
#
# @arg $1 ref(string[]) Name of the array to check.
# @arg $2 string Value to find.
# @arg $3 number (Optional) The index to start searching at [Default=0].
#
# @stdout The index of the value within the array, ArrayUtils_INDEX_NOT_FOUND (-1) if not found.
# @stderr None.
#
# @exitcode 0 When input array references exist and start index is an integer (when declared).
# @exitcode 1 Otherwise.
ArrayUtils.indexOf() {
  local inArrayRef="$1"
  local inValue="$2"
  local inStart="${3:-0}"
  local -n inArray="$inArrayRef" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  ArrayUtils.isArray "$inArrayRef" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isInteger "$inStart" || return "$APASH_FUNCTION_FAILURE"
  
  # If no value to find explicitly declared, then return
  [[ $# -lt 2 ]] && return "$APASH_FUNCTION_FAILURE"
  [[ $inStart -lt 0 ]] && inStart=0
  for ((i = inStart; i < ${#inArray[@]} ; i++)); do
    [[ "${inArray[i]}" == "$inValue" ]] && echo "$i" && return "$APASH_FUNCTION_SUCCESS"
  done
  
  # Return default value if not found
  echo "$ArrayUtils_INDEX_NOT_FOUND"
  return "$APASH_FUNCTION_FAILURE"
}