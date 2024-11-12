#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex
apash.import fr.hastec.apash.commons-lang.MatrixUtils.sh

# File description ###########################################################
# @name MatrixUtils.create
# @brief Create a side array simulating dimensions on an existing array.
#
# @description
#   ⚠️ It is an experimental function.
#   The side array store dimensions of the expected matrix.
#   It does not fix bounds of the array. It's just a view of the mind
#   on how to access a cell on a multi-dimensional array.
#   ⚠️WARNING: 
#   From Matrix point of view, the first index is 0 (even in zsh).
#   The real array start from 1 but MatrixUtils consider it as 0.
#
# ### Since:
# 0.2.0
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
#    MatrixUtils.create  "myMatrix" 3    # failure; does not create array with 1 dimension
#    MatrixUtils.create  "myMatrix" 3 3  # myMatrix=(); apash_dim_myMatrix=(3 3)
#
#    myMatrix=(1 2 3 4 5 6 7 8 9)
#    MatrixUtils.create  "myMatrix" 3 3  # myMatrix=(1 2 3 4 5 6 7 8 9); apash_dim_myMatrix=(3 3)
# ```
#
# @arg $1 ref(string[]) Name of the array.
# @arg $2 number... The number of element per dimension.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the matrix is created.
# @exitcode 1 Otherwise.
MatrixUtils.create() {
  # If less than 2 dimensions are provided then return.
  [[ $# -lt 3 ]] && return "$APASH_FUNCTION_FAILURE"

  local inArrayName="$1"
  local matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${inArrayName}"
  local dim
  local nbDim="$APASH_ARRAY_FIRST_INDEX"
  ArrayUtils.nullToEmpty "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  shift

  local dimensions=("$@")
  
  # Reset the corresponding matrix if already exists.
  unset "$matrixDim"

  # Create the side array with inputs dimensions.
  for dim in "${dimensions[@]}"; do
    if ! ArrayUtils.isArrayIndex "$dim" || [[ $dim -eq 0 ]]  ; then
      unset "$matrixDim"
      return "$APASH_FUNCTION_FAILURE"
    fi
    (( "${matrixDim}[$nbDim]=$dim" ))
    nbDim=$((nbDim+1))
  done
  return "$APASH_FUNCTION_SUCCESS"
}