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
#    MatrixUtils.set "myMatrix" "abc" 3    # myMatrix=(); apash_dim_myMatrix=(3)
#    MatrixUtils.create  "myMatrix" 3 4  # myMatrix=(); apash_dim_myMatrix=(3 4)
# ```
#
# @arg $1 ref(string[]) Name of the array if exists.
# @arg $2 number... The number of element for a new dimension
#
# @stdout None
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
MatrixUtils.set() {
  local matrixName="$1"
  local value="$2"
  MatrixUtils.isMatrix "$matrixName" || return "$APASH_FUNCTION_FAILURE"
  local -n matrix="$matrixName"
  local -i cellIndex=0
  shift 2
  
  cellIndex=$(MatrixUtils.getIndex "$matrixName" "$@") || return "$APASH_FUNCTION_FAILURE"
  matrix[$cellIndex]="$value" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
