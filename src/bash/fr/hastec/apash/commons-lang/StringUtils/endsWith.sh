#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.endsWith
# @brief Check if a string ends with a specified suffix.
# @description
#
# ### Since:
# 0.1.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inString       | string        | in       |            | Input string to check.                |
# | $2     | inSuffix       | string        | in       |            | The suffix to find.                   |
#
# @example
#    StringUtils.endsWith "" ""        # true
#    StringUtils.endsWith "abcd" ""    # true
#    StringUtils.endsWith "abcd" "cd"  # true
#    StringUtils.endsWith "abcd" "bd"  # false
#    StringUtils.endsWith ""     "c"   # false
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 If the string ends with the suffix.
# @exitcode 1 Otherwise.
#
# @see [StringUtils](../StringUtils.md)
StringUtils.endsWith(){
  local inString=$1
  local inSuffix=$2

  [[ $inString =~ $inSuffix$ ]] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}