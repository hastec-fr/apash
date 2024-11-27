#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getDimLastIndex
[ "$APASH_SHELL" = "zsh" ] && apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name MatrixUtils.getDim
# @brief Apply massive modification to a given dimension.
# @description
#   ⚠️ It is an experimental function.
#   The simple case on a two dimensional array is to set a complete row.
#   For more dimensions, it set all sub dimensions
#   of the current offset.
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
# | $2     | outArrayName     | ref(string[]) | out      |                 | Name of the array with dimension     |
# | ${@:3} | $@               | number...     | in       |                 | Indexes per dimension.               |
#
# ### Example
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
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the matrix is modified.
# @exitcode 1 Otherwise.
#/
MatrixUtils.setDim() {
  Log.in $LINENO "$@"
  [ $# -lt 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  local apash_inMatrixName="${1:-}"
  local apash_inArrayName="${2:-}"
  shift 2
  local apash_indexes=("$@")
  local -i apash_start=$APASH_ARRAY_FIRST_INDEX
  local -i apash_lastDimIndex=0
  local -i apash_i

# length=$(MatrixUtils.getDimOffset "$apash_inMatrixName" "${apash_indexes[@]}")
  MatrixUtils.isMatrix "$apash_inMatrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.isArray "$apash_inArrayName"    || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # Get index delimiting the slice of array to modify.
  apash_start=$(MatrixUtils.getIndex "$apash_inMatrixName" "${apash_indexes[@]}")               || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  apash_lastDimIndex=$(MatrixUtils.getDimLastIndex "$apash_inMatrixName" "${apash_indexes[@]}") || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  local -a inMatrix=()
  local -a inArray=()
  ArrayUtils.clone "$apash_inMatrixName" "inMatrix" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.clone "$apash_inArrayName"  "inArray"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # If the number of values to change is greater than dimension then fail.
  [[ $((apash_start + ${#inArray[@]}-1)) -gt ${apash_lastDimIndex} ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  # Apply the value on the original array
  for (( apash_i=apash_start; apash_i < apash_lastDimIndex+1; apash_i++ )); do
    inMatrix[apash_i]=${inArray[APASH_ARRAY_FIRST_INDEX+apash_i-apash_start]}
  done

  ArrayUtils.clone "inMatrix" "$apash_inMatrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
