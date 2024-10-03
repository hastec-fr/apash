#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix

# File description ###########################################################
# @name MatrixUtils.getDimOffsetOffset
# @brief Return the corresponding offset before to fall on the next cell of the same dimension.
#
# @description
# For a two dimensional array it return the length of a row.
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
#    MatrixUtils.create myMatrix 3 3
#    MatrixUtils.getDimOffset "myMatrix" 0 1  # (0)
#    MatrixUtils.getDimOffset "myMatrix" 0    # (3)
#    MatrixUtils.getDimOffset "myMatrix" 1    # (3)
#    MatrixUtils.getDimOffset "myMatrix"      # (9)
# ```
#
# @arg $1 ref(string[]) Name of the matrix.
# @arg $2 number... The index per dimension.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
MatrixUtils.getDimOffset() {
  local matrixName="$1"
  MatrixUtils.isMatrix "$matrixName" || return "$APASH_FUNCTION_FAILURE"
  local -n matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${matrixName}"
  shift

  local indexes=("$@")
  local dimOffset=0
  local -i i

  # Initiliaze the first time with the first dimension then multiply it by the others.
  for ((i=${#indexes[@]}; i < ${#matrixDim[@]}; i++ )); do
    [[ $dimOffset -gt 0 ]] && dimOffset=$((dimOffset * matrixDim[i])) || dimOffset=${matrixDim[i]}
  done

  echo "$dimOffset" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
