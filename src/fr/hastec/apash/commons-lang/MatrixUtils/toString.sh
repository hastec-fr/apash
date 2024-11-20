#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.join
apash.import fr.hastec.apash.commons-lang.ArrayUtils.addFirst

##/
# @name MatrixUtils.create
# @brief Display each virtual indexes of the apash_matrix.
# @description
#   ⚠️ It is an experimental function.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default         | Description                          |
# |--------|----------------|---------------|----------|-----------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | out      |                 | Name of the apash_matrix.                  |
#
# ### Example
# ```bash
#    MatrixUtils.create  "myMatrix" 3    # myMatrix=(); apash_dim_myMatrix=(3)
#    MatrixUtils.create  "myMatrix" 3 4  # myMatrix=(); apash_dim_myMatrix=(3 4)
# ```
#
# @stdout None
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
#/
MatrixUtils.toString() {
  Log.in $LINENO "$@"
  local apash_matrixName="${1:-}"
  local apash_matrix_toString
  local -i apash_i
  local -i apash_j

  MatrixUtils.isMatrix "$apash_matrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if [ "$APASH_SHELL" = "zsh" ]; then
    local -a apash_matrix=()
    ArrayUtils.clone "$apash_matrixName" "apash_matrix" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  else # bash
    local -n apash_matrix="$apash_matrixName"
    local -n apash_matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${apash_matrixName}"
  fi
  
  ArrayUtils.clone "apash_matrixDim" "apash_matrix_toString"

  for (( apash_i=0; apash_i < ${#apash_matrixDim[@]}; apash_i++ )); do
    [[ $apash_i == 0 ]] && totalIndexes=${apash_matrixDim[apash_i]} || totalIndexes=$((totalIndexes * apash_matrixDim[apash_i]))
    apash_matrix_toString[apash_i]=0
  done
  
  for (( apash_i=0; apash_i < totalIndexes; apash_i++ )); do
    echo "$apash_matrixName($(ArrayUtils.join apash_matrix_toString ","))=${apash_matrix[apash_i]} "

    # Refresh dimensions indexes by incrementing the last one.
    apash_matrix_toString[-1]=$((apash_matrix_toString[-1]+1))
    for (( apash_j=${#apash_matrix_toString[@]}-1; apash_j > 0; apash_j--)); do
      if [[ ${apash_matrix_toString[apash_j]} -ge ${apash_matrixDim[apash_j]} ]]; then
        apash_matrix_toString[apash_j]=0
        apash_matrix_toString[apash_j-1]=$((apash_matrix_toString[apash_j-1]+1))
      fi
    done
  done

  Log.out $LINENO; return "$APASH_SUCCESS"
}
