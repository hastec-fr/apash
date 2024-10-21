#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

# File description ###########################################################
# @name ArrayUtils.get
# @brief Gets the nTh element of an array or a default value if the index is out of bounds.
# @description
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
# | $1     | inArrayName    | ref(string[]) | in       |            |  Name of the array to get value.     |
# | $2     | inIndex        | string        | in       |            | Index of the array.                  |
# | $3?    | inDefaultValue | string        | in       | ""         | Default value if index is out of bounds |
#
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
# @stdout The nTh element of an array or a default value if the index is out of bounds (and default value is explicitly declared).
# @stderr None.
#
# @exitcode 0 When first argument is an array and the index is in the bound of the array without declared default value.
# @exitcode 1 Otherwise.
ArrayUtils.get() {
  local inArrayName="$1"
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

  if [ "$APASH_SHELL" = "zsh" ]; then
    echo "${${(P)inArrayName}[$inIndex]}" && return "$APASH_FUNCTION_SUCCESS"
  else
    local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
    echo "${inArray[$inIndex]}" && return "$APASH_FUNCTION_SUCCESS"
  fi

  return "$APASH_FUNCTION_FAILURE"
}