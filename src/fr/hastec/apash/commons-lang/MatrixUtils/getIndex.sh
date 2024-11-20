#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
[ "$APASH_SHELL" = "zsh" ] && apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name MatrixUtils.getIndex
# @brief Return the corresponding array index according to virtual dimensions.
# @description
#   ⚠️ It is an experimental function.
#   Negative apash_indexes are not supported for the moment.
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
# | $1     | ioArrayName    | ref(string[]) | out      |                 | Name of the matrix.                  |
# | ${@:2} | $@             | number...     | in       |                 | apash_indexes per dimension.               |
#
# ### Example
# ```bash
#    myMatrix=(1 2 3 4 5 6 7 8 9)
#    MatrixUtils.create myMatrix 3 3
#    MatrixUtils.getIndex "myMatrix" 0 1  # 1
#    MatrixUtils.getIndex "myMatrix" 1 0  # 3
#    MatrixUtils.getIndex "myMatrix" 1    # 3
#    MatrixUtils.getIndex "myMatrix" 1 2  # 5
#    MatrixUtils.getIndex "myMatrix" 2 1  # 7
#    MatrixUtils.getIndex "myMatrix" 1 4  # failure - Out of bounds 
#    MatrixUtils.getIndex "myMatrix" 3 1  # failure - Out of bounds even if the array has more elements.
# ```
#
# @stdout None
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
#/
MatrixUtils.getIndex() {
  Log.in $LINENO "$@"
  [ $# -lt 1 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  local apash_matrixName="${1:-}"
  shift
  local apash_indexes=("$@")
  local -i apash_offset=0
  local -i apash_cellIndex=APASH_ARRAY_FIRST_INDEX
  local -i apash_i

  MatrixUtils.isMatrix "$apash_matrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if [ "$APASH_SHELL" = "zsh" ]; then
    local -a matrixDim=()
    ArrayUtils.clone "${MatrixUtils_DIM_ARRAY_PREFIX}${apash_matrixName}" "matrixDim"
  else # bash
    local -n matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${apash_matrixName}"
  fi

  # If more apash_indexes are provided than dimension present in the matrix, then fails.
  [[ ${#apash_indexes[@]} -gt ${#matrixDim[@]} ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # Return failure if the index is greater than dimensions
  # even if the array has additional elements.
  # Add the index 0 for each missing dimensions.
  for ((apash_i=APASH_ARRAY_FIRST_INDEX; apash_i < APASH_ARRAY_FIRST_INDEX+${#matrixDim[@]}; apash_i++)); do
    [[ -z "${apash_indexes[apash_i]:-}" ]] && apash_indexes[apash_i]=0
    [[ ${apash_indexes[apash_i]} -ge ${matrixDim[apash_i]} ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  done

  # Sum dimension (@todo: protect overflow).
  apash_offset=${matrixDim[-1]}
  for ((apash_i=APASH_ARRAY_FIRST_INDEX+${#matrixDim[@]}-2; apash_i > APASH_ARRAY_FIRST_INDEX; apash_i--)); do
    apash_offset=$((apash_offset * matrixDim[apash_i] ))
  done

  # Calculate the cell position by adding the apash_offset of each dimensions.
  for ((apash_i=APASH_ARRAY_FIRST_INDEX; apash_i < APASH_ARRAY_FIRST_INDEX+${#apash_indexes[@]}-1; apash_i++)); do
    apash_cellIndex=$((apash_cellIndex + (apash_indexes[apash_i] * apash_offset)))
    apash_offset=$((apash_offset - matrixDim[apash_i]))
  done

  # Return the cell position.
  apash_cellIndex=$(( apash_cellIndex + ${apash_indexes[-1]}))  
  echo "$apash_cellIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
