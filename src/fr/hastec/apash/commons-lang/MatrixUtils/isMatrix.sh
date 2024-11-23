#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex
apash.import fr.hastec.apash.commons-lang.MatrixUtils.sh

##/
# @name MatrixUtils.isMatrix
# @brief Check if all elements defining a matrix are respected.
# @description
#   ⚠️ It is an experimental function.
#   Considered as a matrix, an array which has its side array.
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
#
# ### Example
# ```bash
#    MatrixUtils.isMatrix  "myMatrix"  # false
#
#    myMatrix=(1 2 3 4 5 6)
#    MatrixUtils.isMatrix  "myMatrix"  # false
#
#    MatrixUtils.create myMatrix 3
#    MatrixUtils.isMatrix  "myMatrix"  # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the matrix exists.
# @exitcode 1 Otherwise.
#/
MatrixUtils.isMatrix() {
  Log.in $LINENO "$@"
  local apash_inArrayName="${1:-}"
  local apash_dimMatrixName="${MatrixUtils_DIM_ARRAY_PREFIX}${apash_inArrayName}"
  local -i apash_i

  ArrayUtils.isArray "$apash_inArrayName"        || { Log.out $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.isArray "$apash_dimMatrixName" || { Log.out $LINENO; return "$APASH_FAILURE"; }

  # Check that dimensions are correct values.
  if [ "$APASH_SHELL" = "zsh" ]; then
    for apash_i in "${${(P)apash_dimMatrixName}[@]}"; do
      ArrayUtils.isArrayIndex "$apash_i" || { Log.out $LINENO; return "$APASH_FAILURE"; }
      [ "$apash_i" -eq 0 ]               && { Log.out $LINENO; return "$APASH_FAILURE"; }
    done
  else
    local -n inMatrixDim="$apash_dimMatrixName"
    for apash_i in "${inMatrixDim[@]}"; do
      ArrayUtils.isArrayIndex "$apash_i" || { Log.out $LINENO; return "$APASH_FAILURE"; }
      [ "$apash_i" -eq 0 ]               && { Log.out $LINENO; return "$APASH_FAILURE"; }
    done
  fi

  Log.out $LINENO; return "$APASH_SUCCESS"
}
