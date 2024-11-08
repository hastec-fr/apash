#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex

# File description ###########################################################
# @name MatrixUtils.get
# @brief Get a cell of an array according to its associated matrix.
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

# Method description #########################################################
# @description

# #### Example
# ```bash
#    # Use matrix representation of:
#    #   0 1 2
#    # 0 a b c
#    # 1 d e f
#    # 2 g h i
#
#    local myMatrix=("a" "b" "c" "d" "e" "f" "g" "h" "i")
#    MatrixUtils.create "myMatrix" 3 3
#    MatrixUtils.get myMatrix          # a
#    MatrixUtils.get myMatrix 0 0      # a   
#    MatrixUtils.get myMatrix 1 1      # e
#    MatrixUtils.get myMatrix 1 4      # failure - ""
# ```
#
# @arg $1 ref(string[]) Name of the array if exists.
# @arg $2 number... The number of element for a new dimension
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
MatrixUtils.get() {
  local matrixName="$1"
  MatrixUtils.isMatrix "$matrixName" || return "$APASH_FUNCTION_FAILURE"
  
  local -i cellIndex=0
  shift
  
  cellIndex=$(MatrixUtils.getIndex "$matrixName" "$@") || return "$APASH_FUNCTION_FAILURE"
  if [ "$APASH_SHELL" = "zsh" ]; then
    echo "${${(P)matrixName}[$cellIndex]}" && return "$APASH_FUNCTION_SUCCESS"
  else # bash
    local -n matrix="$matrixName"
    echo "${matrix[$cellIndex]}" && return "$APASH_FUNCTION_SUCCESS"
  fi

  return "$APASH_FUNCTION_FAILURE"
}
