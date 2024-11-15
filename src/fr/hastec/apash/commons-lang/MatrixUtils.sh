#!/usr/bin/env bash
# shellcheck disable=SC2034

##/
# <!-- @class -->
# @name MatrixUtils
# @brief Operations on matrixes.
# @description
#   ⚠️WARNING: It is an experimental function.
#   Bash does not accept multi-dimensionals arrays.
#   The purpose of the MatrixUtil is to simulate it with a one dimensional array
#   Negative indexes are not supported for the moment.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
# 
# @apashSummaryTable
#/
MatrixUtils_DIM_ARRAY_PREFIX="_apash_matrix_dim_"
commons-lang.MatrixUtils() { true; }
