#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getDimLastIndex

# File description ###########################################################
# @name MatrixUtils.getDim
# @brief Apply massive modification to a given dimension.
#
# @description
# The simple case on a two dimensional array is to set a complete row.
# For more dimensions, it set all sub dimensions
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
# ⚠️ It is an experimental function.
# #### Example
# ```bash
#    myMatrix=(1 2 3 4 5 6 7 8 9)
#    myRow=(a b c)
#    MatrixUtils.create "myMatrix" 3 3 
#    MatrixUtils.setDim "myMatrix" "myRow" 1     # (1 2 3 a b c 7 8 9)
#    MatrixUtils.setDim "myMatrix" "myRow" 2 1   # failure - Not enough remaining cell in the dimension
#    myRow=(d e)
#    MatrixUtils.setDim "myMatrix" "myRow" 2 1   # (1 2 3 a b c 7 d e)
# ```
#
# @arg $1 ref(string[]) Name of the matrix.
# @arg $2 ref(string[]) Name of the array with new value.
# @arg $3 number... The index per dimension.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the matrix is modified.
# @exitcode 1 Otherwise.
MatrixUtils.setDim() {
  local inMatrixName="$1"
  local inArrayName="$2"
  shift 2
  local indexes=("$@")
  local -i start=0
  local -i lastDimIndex=0

# length=$(MatrixUtils.getDimOffset "$inMatrixName" "${indexes[@]}")
  MatrixUtils.isMatrix "$inMatrixName" || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$inArrayName"    || return "$APASH_FUNCTION_FAILURE"
  local -n inMatrix="$inMatrixName"
  local -n inArray="$inArrayName"

  # Get index delimiting the slice of array to modify.
  start=$(MatrixUtils.getIndex "$inMatrixName" "${indexes[@]}") || return "$APASH_FUNCTION_FAILURE"
  lastDimIndex=$(MatrixUtils.getDimLastIndex "$inMatrixName" "${indexes[@]}") || return "$APASH_FUNCTION_FAILURE"

  # If the number of values to change is greater than dimension then fail.
  [[ $((start + ${#inArray[@]}-1)) -gt ${lastDimIndex} ]] && return "$APASH_FUNCTION_FAILURE"
  
  # Apply the value on the original array
  for ((i=start; i < lastDimIndex+1; i++ )); do
    inMatrix[i]=${inArray[i-start]}
  done

  return "$APASH_FUNCTION_SUCCESS"
}
