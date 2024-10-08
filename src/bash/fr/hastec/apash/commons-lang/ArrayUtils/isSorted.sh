#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name ArrayUtils.isSorted
# @brief This method checks whether the provided array is sorted according to natural ordering.
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
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
#
# #### Example
# ```bash
#    ArrayUtils.isSorted ""         # false
#    ArrayUtils.isSorted "myVar"    # false
#
#    declare -A myMap
#    ArrayUtils.isSorted "myMap"    # false
#
#    myArray=()
#    ArrayUtils.isSorted "myArray"  # true
#
#    myArray=("a" "b" "c")
#    ArrayUtils.isSorted "myArray"  # true
#
#    myArray=("a" "c" "b")
#    ArrayUtils.isSorted "myArray"  # false
#
#    myArray=("beta-1" "beta-10" "beta-20")
#    ArrayUtils.isSorted "myArray"  # true
#
#    myArray=("1" "a")
#    ArrayUtils.isSorted "myArray"  # true
#   
#    myArray=("" "1")
#    ArrayUtils.isSorted "myArray"  # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 True Whether the array is sorted according to natural ordering.
# @exitcode 1 Otherwise.
ArrayUtils.isSorted() {
  local inArrayName="$1"
  local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"

  for (( i=0; i<${#inArray[@]}-1; i++ )); do
    [[ "${inArray[i]}" > "${inArray[i+1]}" ]] && return "$APASH_FUNCTION_FAILURE"
  done

  return "$APASH_FUNCTION_SUCCESS"
}