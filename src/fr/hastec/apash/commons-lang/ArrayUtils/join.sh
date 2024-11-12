#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.join
# @brief Return all elements of an array joined by an input string.
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
#    ArrayUtils.join  ""       ""            # failure - ""
#    ArrayUtils.join  "myVar"  "a"           # failure - ""
#
#    declare -A myMap
#    ArrayUtils.join  "myMap"  "a"           # failure - ""
#
#    myArray=("a" "b" "" "c")
#    ArrayUtils.join  "myArray"              # "a b  c"
#    ArrayUtils.join  "myArray"  ","         # "a,b,,c"
#    ArrayUtils.join  "myArray"  "|1|"       # "a|1|b|1||1|c"
# ```
#
# @arg $1 ref(string[]) Name of the array to get values.
# @arg $2 string The delimiter which join values. (Default=" ")
#
# @stdout A single string having all values of the array joined by the chosen delimiter.
# @stderr None.
#
# @exitcode 0 When first argument is an array.
# @exitcode 1 Otherwise.
ArrayUtils.join() {
  local inArrayName="$1"
  local inDelimiter="${2:- }"
  ArrayUtils.isArray "$inArrayName"  || return "$APASH_FUNCTION_FAILURE"
  local -n inArray="$inArrayName"  
  local -i i
  local outString="${inArray[0]}"

  # Trick with IFS does not accept delimiter with multiple chars.
  for (( i=1; i < ${#inArray[@]}; i++ )); do
    outString+="${inDelimiter}${inArray[i]}"
  done

  echo "$outString" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}