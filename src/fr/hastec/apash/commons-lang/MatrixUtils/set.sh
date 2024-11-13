#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

# File description ###########################################################
# @name MatrixUtils.create
# @brief Set the value of a cell according to the dimensions of the matrix.
#
# @description
#   ⚠️ It is an experimental function.
#    Note that index in matrix start from 0 (even in zsh).
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MatrixUtils](../MatrixUtils.md) / 
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
  [ $# -lt 2 ] && return "$APASH_FUNCTION_FAILURE"
  local matrixName="$1"
  local value="$2"
  local -i cellIndex=$APASH_ARRAY_FIRST_INDEX
  shift 2

  MatrixUtils.isMatrix "$matrixName" || return "$APASH_FUNCTION_FAILURE"
  cellIndex=$(MatrixUtils.getIndex "$matrixName" "$@") || return "$APASH_FUNCTION_FAILURE"
  
  # @todo: find a way in zsh to set directly the cell instead of cloning.
  if [ "$APASH_SHELL" = "zsh" ]; then
    # ${(P)matrixName}[$cellIndex]="$value" && return "$APASH_FUNCTION_SUCCESS"
    local matrix=()
    ArrayUtils.clone "$matrixName" "matrix" || return "$APASH_FUNCTION_FAILURE"
    matrix[$cellIndex]="$value"             || return "$APASH_FUNCTION_FAILURE"
    ArrayUtils.clone "matrix" "$matrixName" && return "$APASH_FUNCTION_SUCCESS"
  else
    local -n matrix="$matrixName"
    matrix[$cellIndex]="$value" && return "$APASH_FUNCTION_SUCCESS"
  fi
  
  return "$APASH_FUNCTION_FAILURE"
}
