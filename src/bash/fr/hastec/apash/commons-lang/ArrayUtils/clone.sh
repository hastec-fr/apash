#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.init

# File description ###########################################################
# @name ArrayUtils.clone
# @brief Copy an array into another array using references.
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
# | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to clone.          |
# | $2     | outArrayName   | ref(string[]) | out      |            | Name of the array which will receive the clone.|
#
# #### Example
# ```bash
#    ArrayUtils.clone  ""       ""               # failure
#
#    declare -A myMap
#    ArrayUtils.addFirst  "myMap"  "a"           # failure
#
#    declare -a myClone
#    ArrayUtils.clone  "myVar"  "myClone"        # failure
#
#    myArray=()
#    myClone=("a")
#    ArrayUtils.clone     "myArray"  "myClone"   # myClone=()
#    
#    myArray=("a" "b" "" "c")
#    myClone=("d" "e" "f")
#    ArrayUtils.clone     "myArray"  "myClone"   # myClone=("a" "b" "" "c")
#
#    myArray=("a" "b" "" "c")
#    myClone=()
#    ArrayUtils.clone     "myArray"  "myClone"   # myClone=("a" "b" "" "c")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When input arguments are arrays.
# @exitcode 1 Otherwise.
ArrayUtils.clone() {
  local ref_ArrayUtils_clone_inArrayNameName="$1"
  local ref_ref_ArrayUtils_clone_outArrayName="$2"
  ArrayUtils.isArray "$ref_ArrayUtils_clone_inArrayNameName"  || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.init    "$ref_ref_ArrayUtils_clone_outArrayName" || return "$APASH_FUNCTION_FAILURE"
  
  local -n ref_ArrayUtils_clone_inArrayName="$ref_ArrayUtils_clone_inArrayNameName"   2> /dev/null || return "$APASH_FUNCTION_FAILURE"
  local -n ref_ArrayUtils_clone_outArray="$ref_ref_ArrayUtils_clone_outArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
  local i
  # Can't use direct wrapping because need to preserve indexes
  # ref_ArrayUtils_clone_outArray=("${ref_ArrayUtils_clone_inArrayName[@]}")
  
  for i in "${!ref_ArrayUtils_clone_inArrayName[@]}"; do
    # shellcheck disable=SC2034
    ref_ArrayUtils_clone_outArray[i]="${ref_ArrayUtils_clone_inArrayName[i]}"
  done

  return "$APASH_FUNCTION_SUCCESS"
}
