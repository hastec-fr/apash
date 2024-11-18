#!/usr/bin/env bash
# shellcheck disable=SC2068

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getDimOffset
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex
apash.import fr.hastec.apash.commons-lang.ArrayUtils.remove
[ "$APASH_SHELL" = "zsh" ] && apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name MatrixUtils.getDimLastIndex
# @brief Return the corresponding last index of the chosen dimension from the orginal array.
# @description
#   ⚠️ It is an experimental function.
#   For a two dimensional arrays it return the last index of a row.
#   It transforms the last provided dimension and other missing dimensions
#   to 0. Then it get the offset of the current dimension to calculate the 
#   last index.
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
#    MatrixUtils.getDimLastIndex "myMatrix" 0    # 2 - zsh: 3
#    MatrixUtils.getDimLastIndex "myMatrix" 0 1  # 2 - zsh: 3
#    MatrixUtils.getDimLastIndex "myMatrix" 1    # 5 - zsh: 6
#    MatrixUtils.getDimLastIndex "myMatrix" 2 0  # 8 - zsh: 9
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
#/
MatrixUtils.getDimLastIndex() {
  Log.in $LINENO "$@"
  [ $# -lt 1 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  local matrixName="$1"
  shift
  local indexes=("$@")
  local -i dimOffset
  local -i lastIndex

  MatrixUtils.isMatrix "$matrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # Get the current index position in the original array.
  curIndex=$(MatrixUtils.getIndex "$matrixName" ${indexes[@]}) || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if [ "$APASH_SHELL" = "zsh" ]; then
    local matrixDim=()
    ArrayUtils.clone "${MatrixUtils_DIM_ARRAY_PREFIX}${matrixName}" "matrixDim" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  else # bash
    local -n matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${matrixName}"
  fi

  # If all dimensions are provided, then remove the last offset
  # to be at the beginning of the dimension. 
  # For the calculation of the dim offset, we consider the row and not the cell.
  if [[ ${#indexes[@]} -eq ${#matrixDim[@]} ]]; then
    firstIndex=$((curIndex-indexes[-1]))
    unset 'indexes[${#indexes[@]}-1]'
  else
    # It means that we are at the beginning of a dimension.
    firstIndex=$curIndex
  fi

  # Get the offset of the current dimension. If it was a cell, the last dimension is removed 
  # to get the corresponding dimension (row)
  dimOffset=$(MatrixUtils.getDimOffset "$matrixName" ${indexes[@]}) || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # The lastIndex of the dimension is the first index + offset of the dimension - 1.
  lastIndex=$((firstIndex + dimOffset - 1))
  
  echo "$lastIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
