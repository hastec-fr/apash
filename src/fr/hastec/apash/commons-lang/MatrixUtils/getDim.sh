#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getDimOffset
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.ArrayUtils.subarray

##/
# @name MatrixUtils.getDim
# @brief Return the corresponding array according to virtual dimensions.
# @description
#   ⚠️ It is an experimental function.
#   The simple case on a two dimensional array is to retreive a row.
#   For more dimensions, it returns an array containing all sub dimensions
#   of the current offset.
#
# ## History
# @since 0.2.0 (hastec-fr)
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
#    MatrixUtils.create "mySubArray" "myMatrix" 3 3
#    MatrixUtils.getDim "mySubArray" "myMatrix" 0 1  # (1)
#    MatrixUtils.getDim "mySubArray" "myMatrix" 0    # (1 2 3)
#    MatrixUtils.getDim "mySubArray" "myMatrix" 1    # (4 5 6)
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the subarray is returned.
# @exitcode 1 Otherwise.
#/
MatrixUtils.getDim() {
  Log.in $LINENO "$@"
  [ $# -lt 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  local inArrayName="${1:-}"
  local matrixName="${2:-}"
  shift 2
  local indexes=("$@")
  local start=$APASH_ARRAY_FIRST_INDEX
  local length=0

  ArrayUtils.nullToEmpty "$inArrayName"                              || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  MatrixUtils.isMatrix   "$matrixName"                               || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  start=$(MatrixUtils.getIndex "$matrixName" "${indexes[@]:-}")      || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  length=$(MatrixUtils.getDimOffset "$matrixName" "${indexes[@]:-}") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  # Keep at least one cell
  [[ $length -le 0 ]] && length=1
  ArrayUtils.subarray "$inArrayName" "$matrixName" "$start" $((start + length)) || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
