#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.join
apash.import fr.hastec.apash.commons-lang.ArrayUtils.addFirst

# File description ###########################################################
# @name MatrixUtils.create
# @brief Display each virtual indexes of the matrix.
#
# @description
#   ⚠️ It is an experimental function.
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
#
# Method description #########################################################
# @description
# #### Example
# ```bash
#    MatrixUtils.create  "myMatrix" 3    # myMatrix=(); apash_dim_myMatrix=(3)
#    MatrixUtils.create  "myMatrix" 3 4  # myMatrix=(); apash_dim_myMatrix=(3 4)
# ```
#
# @arg $1 ref(string[]) Name of the matrix to display.
#
# @stdout None
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
MatrixUtils.toString() {
  local matrixName="$1"
  local -i i
  local _apash_matrix_toString

  MatrixUtils.isMatrix "$matrixName" || return "$APASH_FUNCTION_FAILURE"

  if [ "$APASH_SHELL" = "zsh" ]; then
    local matrix=()
    ArrayUtils.clone "$matrixName" "matrix"
  else # bash
    local -n matrix="$matrixName"
    local -n matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${matrixName}"
  fi
  
  ArrayUtils.clone "matrixDim" "_apash_matrix_toString"

  for (( i=0; i < ${#matrixDim[@]}; i++ )); do
    [[ $i == 0 ]] && totalIndexes=${matrixDim[i]} || totalIndexes=$((totalIndexes * matrixDim[i]))
    _apash_matrix_toString[i]=0
  done
  
  for (( i=0; i < totalIndexes; i++ )); do
    echo "$matrixName($(ArrayUtils.join _apash_matrix_toString ","))=${matrix[i]} "

    # Refresh dimensions indexes by incrementing the last one.
    _apash_matrix_toString[-1]=$((_apash_matrix_toString[-1]+1))
    for (( j=${#_apash_matrix_toString[@]}-1; j > 0; j--)); do
      if [[ ${_apash_matrix_toString[j]} -ge ${matrixDim[j]} ]]; then
        _apash_matrix_toString[j]=0
        _apash_matrix_toString[j-1]=$((_apash_matrix_toString[j-1]+1))
      fi
    done
  done

  return "$APASH_FUNCTION_SUCCESS"
}
