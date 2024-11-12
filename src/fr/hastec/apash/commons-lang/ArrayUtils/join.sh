#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLength

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
#    
#    myArray[6]="z"
#    ArrayUtils.join  "myArray"  ","         # "a,b,,c,,z"
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
  local -i i
  local outString=""
  local length

  arrayLength=$(ArrayUtils.getLength "$inArrayName") || return "$APASH_FUNCTION_FAILURE"
  
  if [ "$APASH_SHELL" = "zsh" ]; then
    outString="${${(P)inArrayName}[APASH_ARRAY_FIRST_INDEX]}"
    for (( i=APASH_ARRAY_FIRST_INDEX+1; i < APASH_ARRAY_FIRST_INDEX + arrayLength; i++ )); do
      outString+="${inDelimiter}${${(P)inArrayName}[i]}"
    done
  else # bash
    local -n inArray="$inArrayName"
    outString="${inArray[0]}"
    # Trick with IFS does not accept delimiter with multiple chars.
    for (( i=APASH_ARRAY_FIRST_INDEX+1; i < APASH_ARRAY_FIRST_INDEX + arrayLength; i++ )); do
      outString+="${inDelimiter}${inArray[i]}"
    done
  fi

  echo "$outString" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}