#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex

# File description ###########################################################
# @name MatrixUtils.create
# @brief Set the value of a cell according to the dimensions of the matrix.
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
#    myMatrix=(1 2 3 4 5 6 7 8 9)
#    MatrixUtils.create myMatrix 3 3
#    MatrixUtils.set "myMatrix" "a" 0 0  # (a 2 3 4 5 6 7 8 9)
#    MatrixUtils.set "myMatrix" "b" 0 2  # (a 2 b 4 5 6 7 8 9)
#    MatrixUtils.set "myMatrix" "c" 1 1  # (a 2 b 4 c 6 7 8 9)
# ```
#
# @arg $1 ref(string[]) Name of the array if exists.
# @arg $1 string The new value.
# @arg $2 number... The index per dimension.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the cell is updated.
# @exitcode 1 Otherwise.
MatrixUtils.set() {
  local matrixName="$1"
  local value="$2"
  MatrixUtils.isMatrix "$matrixName" || return "$APASH_FUNCTION_FAILURE"
  local -n matrix="$matrixName"
  local -i cellIndex=0
  shift 2
  
  cellIndex=$(MatrixUtils.getIndex "$matrixName" "$@" || return "$APASH_FUNCTION_FAILURE") 
  matrix[$cellIndex]="$value" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
