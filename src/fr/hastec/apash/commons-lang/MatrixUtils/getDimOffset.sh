#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix

##/
# @name MatrixUtils.getDimOffsetOffset
# @brief Return the corresponding offset before to fall on the next cell of the same dimension.
# @description
#   ⚠️ It is an experimental function.
#   For a two dimensional array it return the length of a row.
#   For a cell, keep at least an offset of 1.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName          | Type          | in/out   | Default         | Description                          |
# |--------|------------------|---------------|----------|-----------------|--------------------------------------|
# | $1     | apash_matrixName | ref(string[]) | out      |                 | Name of the matrix.                  |
# | ${@:2} | $@               | number...     | in       |                 | Indexes per dimension.               |
#
# ### Example
# ```bash
#    myMatrix=(1 2 3 4 5 6 7 8 9)
#    MatrixUtils.create myMatrix 3 3
#    MatrixUtils.getDimOffset "myMatrix" 0 1  # 1
#    MatrixUtils.getDimOffset "myMatrix" 0    # 3
#    MatrixUtils.getDimOffset "myMatrix" 1    # 3
#    MatrixUtils.getDimOffset "myMatrix"      # 9
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
#/
MatrixUtils.getDimOffset() {
  Log.in $LINENO "$@"
  [ $# -lt 1 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  local apash_matrixName="${1:-}"
  shift
  local apash_indexes=("$@")
  local apash_dimOffset=0
  local -i apash_i

  # Fix potential empty argument.
  [ -z "${apash_indexes[APASH_ARRAY_FIRST_INDEX]:-}" ] && apash_indexes=()

  MatrixUtils.isMatrix "$apash_matrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  local apash_dimMatrixName="${MatrixUtils_DIM_ARRAY_PREFIX}${apash_matrixName}"

  # Initiliaze the first time with the first dimension then multiply it by the others.
  if [ "$APASH_SHELL" = "zsh" ]; then
    for (( apash_i=${#apash_indexes[@]}; apash_i < ${#${(P)apash_dimMatrixName}[@]}; apash_i++ )); do
      [[ $apash_dimOffset -gt 0 ]] && apash_dimOffset=$((apash_dimOffset * ${${(P)apash_dimMatrixName}[APASH_ARRAY_FIRST_INDEX+apash_i]})) || apash_dimOffset=${${(P)apash_dimMatrixName}[APASH_ARRAY_FIRST_INDEX+apash_i]}
    done
  else # bash
    local -n apash_matrixDim="$apash_dimMatrixName"
    for (( apash_i=${#apash_indexes[@]}; apash_i < ${#apash_matrixDim[@]}; apash_i++ )); do
      [[ $apash_dimOffset -gt 0 ]] && apash_dimOffset=$((apash_dimOffset * apash_matrixDim[apash_i])) || apash_dimOffset=${apash_matrixDim[apash_i]}
    done
  fi
  
  # Keep at least one cell.
  [ "$apash_dimOffset" -le 0 ] && apash_dimOffset=1

  echo "$apash_dimOffset" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
