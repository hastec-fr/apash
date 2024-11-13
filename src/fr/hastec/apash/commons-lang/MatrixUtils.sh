#!/usr/bin/env bash
# shellcheck disable=SC2034
# <!-- @class -->
# @name MatrixUtils
# @brief Operations on matrixes.
# @description
#   ⚠️ It is an experimental function.
#   Bash does not accept multi-dimensionals arrays.
#   The purpose of the MatrixUtil is to simulate it with a one dimensional array
#   Negative indexes are not supported for the moment.
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../.md) / [apash](../../apash.md) / [commons-lang](../commons-lang.md) / 
# <!-- apash.parentEnd -->
#
# 
# ### Method Summary
# <!-- apash.summaryTableBegin -->
# | Methods                  | Brief                                 |
# |--------------------------|---------------------------------------|
# |[create](MatrixUtils/create.md)|Create a side array simulating dimensions on an existing array.|
# |[get](MatrixUtils/get.md)|Get a cell of an array according to its associated matrix.|
# |[getDim](MatrixUtils/getDim.md)|Return the corresponding array according to virtual dimensions.|
# |[getDimLastIndex](MatrixUtils/getDimLastIndex.md)|Return the corresponding last index of the chosen dimension from the orginal array.|
# |[getDimOffset](MatrixUtils/getDimOffset.md)|Return the corresponding offset before to fall on the next cell of the same dimension.|
# |[getIndex](MatrixUtils/getIndex.md)|Return the corresponding array index according to virtual dimensions.|
# |[isMatrix](MatrixUtils/isMatrix.md)|Check if all elements defining a matrix are respected.|
# |[set](MatrixUtils/set.md)|Set the value of a cell according to the dimensions of the matrix.|
# |[setDim](MatrixUtils/setDim.md)|Apply massive modification to a given dimension.|
# |[toString](MatrixUtils/toString.md)|Display each virtual indexes of the matrix.|
# <!-- apash.summaryTableEnd -->
MatrixUtils_DIM_ARRAY_PREFIX="_apash_matrix_dim_"









