#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

# File description ###########################################################
# @name ArrayUtils.isArrayIndex
# @brief Check if the given index is a long positive integer.
#
# @description
# Mark bounds of an array for 64bits systems (from 0 to Long_MAX_VALUE).
# This function does not return if the array has the index, for that please 
# check the function isArrayIndexValid.
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
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inIndex        | number        | in       |            | The index number to analyse          |
# 
# #### Example
# ```bash
#    ArrayUtils.isArrayIndex "0"                    # true
#    ArrayUtils.isArrayIndex "1"                    # true
#    ArrayUtils.isArrayIndex "9223372036854775807"  # true
#    ArrayUtils.isArrayIndex "9223372036854775808"  # false
#    ArrayUtils.isArrayIndex "-1"                   # false
#    ArrayUtils.isArrayIndex "1.2"                  # false
#    ArrayUtils.isArrayIndex "a"                    # false
#    ArrayUtils.isArrayIndex                        # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 Whether the given index is a long positive number.
# @exitcode 1 Otherwise.
ArrayUtils.isArrayIndex() {
  local inIndex="$1"
  NumberUtils.isLong "$inIndex" || return "$APASH_FUNCTION_FAILURE"
  [[ $inIndex -ge 0 ]] || return "$APASH_FUNCTION_FAILURE"  
  return "$APASH_FUNCTION_SUCCESS"
}
