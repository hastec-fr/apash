#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getDimOffset
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.ArrayUtils.subarray

# File description ###########################################################
# @name MatrixUtils.getDim
# @brief Return the corresponding array according to virtual dimensions
#
# @description
# The simple case on a two dimensional array is to retreive a complete row.
# For more dimensions, it returns an array containing all sub dimensions
# of the current offset.
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
# #### Example
# ```bash
#    myMatrix=(1 2 3 4 5 6 7 8 9)
#    MatrixUtils.create "mySubArray" "myMatrix" 3 3
#    MatrixUtils.getDim "mySubArray" "myMatrix" 0 1  # (1)
#    MatrixUtils.getDim "mySubArray" "myMatrix" 0    # (1 2 3)
#    MatrixUtils.getDim "mySubArray" "myMatrix" 1    # (4 5 6)
# ```
#
# @arg $1 ref(string[]) Name of the matrix.
# @arg $2 number... The index at each dimension.
#
# @stdout None
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
MatrixUtils.getDim() {
  local inArrayName="$1"
  local matrixName="$2"
  shift 2
  local indexes=("$@")
  local start=0
  local length=0

  ArrayUtils.nullToEmpty "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  MatrixUtils.isMatrix   "$matrixName"  || return "$APASH_FUNCTION_FAILURE"
  start=$(MatrixUtils.getIndex "$matrixName" "${indexes[@]}")
  length=$(MatrixUtils.getDimOffset "$matrixName" "${indexes[@]}")
  # Keept at least one cell
  [[ $length -le 0 ]] && length=1
  ArrayUtils.subarray "$inArrayName" "$matrixName" "$start" $((start + length)) || return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}
