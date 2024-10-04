#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex
apash.import fr.hastec.apash.commons-lang.MatrixUtils.sh

# File description ###########################################################
# @name MatrixUtils.isMatrix
# @brief Check if all elements defining a matrix are respected.
#
# @description
#   Considered as a matrix, an array which has its associative dimension array.
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
# ⚠️ It is an experimental function.
# #### Example
# ```bash
#    MatrixUtils.isMatrix  "myMatrix"  # false
#
#    myMatrix=(1 2 3 4 5 6)
#    MatrixUtils.isMatrix  "myMatrix"  # false
#
#    MatrixUtils.create myMatrix 3
#    MatrixUtils.isMatrix  "myMatrix"  # true
# ```
#
# @arg $1 ref(string[]) Name of the array if exists.
#
# @stdout None
# @stderr None.
#
# @exitcode 0 When the matrix exists.
# @exitcode 1 Otherwise.
MatrixUtils.isMatrix() {
  local inArrayName="$1"
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "${MatrixUtils_DIM_ARRAY_PREFIX}${inArrayName}" || return "$APASH_FUNCTION_FAILURE"
  local -n inMatrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${inArrayName}"
  local -i i  

  # Check that dimensions are correct values
  for i in "${inMatrixDim[@]}"; do
    ArrayUtils.isArrayIndex "$i" || return "$APASH_FUNCTION_FAILURE"
    [ "$i" -eq 0 ] && return "$APASH_FUNCTION_FAILURE"
  done

  return "$APASH_FUNCTION_SUCCESS"
}
