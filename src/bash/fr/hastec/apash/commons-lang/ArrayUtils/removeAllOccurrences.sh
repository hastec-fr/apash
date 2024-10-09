#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeAll

# File description ###########################################################
# @name ArrayUtils.removeAllOccurrences
# @brief Removes the occurrences of the specified element from the specified array.
# @description
#   All subsequent elements are shifted to the left (subtracts one from their indices). 
#   If the array doesn't contains such an element, no elements are removed from the array.
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
# | $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array to modify.        |
# | $2     | inValue        | string        | in       |            |  The value to remove from the array. |
#
# #### Example
# ```bash
#    myArray=("a" "b" "a" "c" "" "d")
#    ArrayUtils.removeAllOccurrences  "myArray"            # failure
#    ArrayUtils.removeAllOccurrences  "myArray"  "a"       # ("b" "c" "" "d")
#    ArrayUtils.removeAllOccurrences  "myArray"  ""        # ("b" "c" "d")
#    ArrayUtils.removeAllOccurrences  "myArray"  "e"       # ("b" "c" "d")
#
#    myArray=("a")
#    ArrayUtils.removeAllOccurrences  "myArray"  "a"       # ()
#    ArrayUtils.removeAllOccurrences  "myArray"  "a"       # ()
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When all arguments are removed from the array.
# @exitcode 1 Otherwise.
ArrayUtils.removeAllOccurrences() {
  local ioArrayRef="$1"
  local inValue="$2"
  local i="0"
  local indexes=()
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"
  local -n inArray="$ioArrayRef"
  [ $# -ne 2 ] && return "$APASH_FUNCTION_FAILURE"
  
  # Get all indexes to remove
  for ((i=0; i < ${#inArray[@]}; i++)); do
    [[ "${inArray[i]}" == "$inValue" ]] && indexes+=("$i")
  done

  # If nothing to remove then success.
  [[ ${#indexes[@]} -eq 0 ]] && return "$APASH_FUNCTION_SUCCESS"

  # Then remove all indexes
  # shellcheck disable=SC2068
  ArrayUtils.removeAll "$ioArrayRef" ${indexes[@]} || return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}