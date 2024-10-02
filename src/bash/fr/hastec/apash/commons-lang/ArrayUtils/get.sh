#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

# File description ###########################################################
# @name ArrayUtils.get
# @brief Gets the nTh element of an array or a default value if the index is out of bounds.
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
#    ArrayUtils.get  ""       ""            # failure - ""
#    ArrayUtils.get  "myVar"  "a"           # failure - ""
#
#    declare -A myMap
#    ArrayUtils.get  "myMap"  "a"           # failure - ""
#
#    myArray=("a" "b" "" "c")
#    ArrayUtils.get  "myArray"              # failure - ""
#    ArrayUtils.get  "myArray"  "0"         # "a"
#    ArrayUtils.get  "myArray"  "3"         # "c"
#    ArrayUtils.get  "myArray"  "-1"        # failure - ""
#    ArrayUtils.get  "myArray"  "a" " "     # " "
#    ArrayUtils.get  "myArray"  "-1" " "    # " "
#    ArrayUtils.get  "myArray"  "5"  "foo"  # "foo"
# ```
#
# @arg $1 ref(string[]) Name of the array to get value.
# @arg $2 string Index of the array.
# @arg $3 string [Optional] Default value if index is out of bounds (default: " ").
#
# @stdout The nTh element of an array or a default value if the index is out of bounds (and default value is explicitly declared).
# @stderr None.
#
# @exitcode 0 When first argument is an array and the index is in the bound of the array without declared default value.
# @exitcode 1 Otherwise.
ArrayUtils.get() {
  local inArrayName="$1"
  local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  local inIndex="$2"
  local inDefaultValue="$3"
  local lastIndex
  
  ArrayUtils.isArray "$inArrayName"  || return "$APASH_FUNCTION_FAILURE"
  if ! ArrayUtils.isArrayIndex "$inIndex"; then
    [[ $# -ne 3 ]] && return "$APASH_FUNCTION_FAILURE"
    echo "$inDefaultValue" && return "$APASH_FUNCTION_SUCCESS"
  fi

  lastIndex=$(ArrayUtils.getLastIndex "$inArrayName") || return "$APASH_FUNCTION_FAILURE"
  [[ inIndex -gt $lastIndex && $# -ne 3 ]] && return "$APASH_FUNCTION_FAILURE"
  [[ inIndex -gt $lastIndex ]] && echo "$inDefaultValue" && return "$APASH_FUNCTION_SUCCESS"

  echo "${inArray[$inIndex]}" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}