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
#   Negative indexes are not supported for the moment.
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
# | ${@:2} | $@             | number...     | in       |                 | Indexes per dimension.               |
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
  local matrixName="$1"
  shift
  local indexes=("$@")
  local -i offset=0
  local -i cellIndex=APASH_ARRAY_FIRST_INDEX
  local -i i

  MatrixUtils.isMatrix "$matrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if [ "$APASH_SHELL" = "zsh" ]; then
    local matrixDim=()
    ArrayUtils.clone "${MatrixUtils_DIM_ARRAY_PREFIX}${matrixName}" "matrixDim"
  else # bash
    local -n matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${matrixName}"
  fi

  # If more indexes are provided than dimension present in the matrix, then fails.
  [[ ${#indexes[@]} -gt ${#matrixDim[@]} ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # Return failure if the index is greater than dimensions
  # even if the array has additional elements.
  # Add the index 0 for each missing dimensions.
  for ((i=APASH_ARRAY_FIRST_INDEX; i < APASH_ARRAY_FIRST_INDEX+${#matrixDim[@]}; i++)); do
    [[ -z "${indexes[i]}" ]] && indexes[i]=0
    [[ ${indexes[i]} -ge ${matrixDim[i]} ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  done

  # Sum dimension (@todo: protect overflow).
  offset=${matrixDim[-1]}
  for ((i=APASH_ARRAY_FIRST_INDEX+${#matrixDim[@]}-2; i > APASH_ARRAY_FIRST_INDEX; i--)); do
    offset=$((offset * matrixDim[i] ))
  done

  # Calculate the cell position by adding the offset of each dimensions.
  for ((i=APASH_ARRAY_FIRST_INDEX; i < APASH_ARRAY_FIRST_INDEX+${#indexes[@]}-1; i++)); do
    cellIndex=$((cellIndex + (indexes[i] * offset)))
    offset=$((offset - matrixDim[i]))
  done

  # Return the cell position.
  cellIndex=$(( cellIndex + ${indexes[-1]}))  
  echo "$cellIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
