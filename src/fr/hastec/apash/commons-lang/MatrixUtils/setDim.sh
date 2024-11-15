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
# | #      | varName        | Type          | in/out   | Default         | Description                          |
# |--------|----------------|---------------|----------|-----------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | out      |                 | Name of the matrix.                  |
# | $2     | outArrayName   | ref(string[]) | out      |                 | Name of the array with dimension     |
# | ${@:3} | $@             | number...     | in       |                 | Indexes per dimension.               |
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
  Log.entry "$LINENO" "$@"
  [ $# -lt 2 ] && return "$APASH_FUNCTION_FAILURE"
  local inMatrixName="$1"
  local inArrayName="$2"
  shift 2
  local indexes=("$@")
  local -i start=$APASH_ARRAY_FIRST_INDEX
  local -i lastDimIndex=0

# length=$(MatrixUtils.getDimOffset "$inMatrixName" "${indexes[@]}")
  MatrixUtils.isMatrix "$inMatrixName" || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$inArrayName"    || return "$APASH_FUNCTION_FAILURE"

  # Get index delimiting the slice of array to modify.
  start=$(MatrixUtils.getIndex "$inMatrixName" "${indexes[@]}") || return "$APASH_FUNCTION_FAILURE"
  lastDimIndex=$(MatrixUtils.getDimLastIndex "$inMatrixName" "${indexes[@]}") || return "$APASH_FUNCTION_FAILURE"

  local inMatrix=()
  local inArray=()
  ArrayUtils.clone "$inMatrixName" "inMatrix" || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.clone "$inArrayName"  "inArray"  || return "$APASH_FUNCTION_FAILURE"

  # If the number of values to change is greater than dimension then fail.
  [[ $((start + ${#inArray[@]}-1)) -gt ${lastDimIndex} ]] && return "$APASH_FUNCTION_FAILURE"
  
  # Apply the value on the original array
  for ((i=start; i < lastDimIndex+1; i++ )); do
    inMatrix[i]=${inArray[APASH_ARRAY_FIRST_INDEX+i-start]}
  done

  ArrayUtils.clone "inMatrix" "$inMatrixName" || return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}
