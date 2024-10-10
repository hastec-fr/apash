#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLongPositive

# File description ###########################################################
# @name StringUtils.repeat
# @brief repeats a string.
# @description
#
# ### Since:
# 0.2.0
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
# | $1     | inNumber       | number        | in       |            | The number of time string is repeated.|
# | $2     | inString       | string        | in       |            | The string to repeat.                 |
#
# @example
#    StringUtils.repeat 3 "a"       # "aaa"
#    StringUtils.repeat 2 "ab"      # "abab"
#
# @stdout The repeated string.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
StringUtils.repeat() {
  local inNumber="$1"
  local inString="$2"
  
  NumberUtils.isLongPositive "$inNumber" || return "$APASH_FUNCTION_FAILURE"
  printf "%0.s$inString" $(seq 1 "$inNumber") && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}

