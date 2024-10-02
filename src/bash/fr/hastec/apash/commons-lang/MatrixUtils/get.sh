#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex

# File description ###########################################################
# @name MatrixUtils.create
# @brief Create a an array simulating input dimensions by the user.
#
# @description
#   To simulate, an additional array keeping in mind dimensions is used.
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
#    MatrixUtils.create  "myMatrix" 3    # myMatrix=(); apash_dim_myMatrix=(3)
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
MatrixUtils.get() {
  local matrixName="$1"
  MatrixUtils.isMatrix "$matrixName" || return "$APASH_FUNCTION_FAILURE"
  local -n matrix="$matrixName"
  shift
  local -i cellIndex=0
  
  cellIndex=$(MatrixUtils.getIndex "$matrixName" "$@") || return "$APASH_FUNCTION_FAILURE"
  echo "${matrix[$cellIndex]}" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
