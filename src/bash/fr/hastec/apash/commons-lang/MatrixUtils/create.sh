#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.MatrixUtils.sh

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
MatrixUtils.create() {
  local inArrayName="$1"
  local matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${inArrayName}"
  local dim
  local nbDim=0
  ArrayUtils.nullToEmpty "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  shift

  local dimensions=("$@")
  # Reset the corresponding matrix if already exists
  unset "$matrixDim"

  # Create the relative dimensions array
  for dim in "${dimensions[@]}"; do
    if ! ArrayUtils.isArrayIndex "$dim"; then
      unset "$matrixDim"
      return "$APASH_FUNCTION_FAILURE"
    fi
    (( "${matrixDim}[$nbDim]=$dim" ))
    nbDim=$((nbDim+1))
  done
  return "$APASH_FUNCTION_FAILURE"
}
