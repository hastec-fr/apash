#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

# File description ###########################################################
# @name NumberUtils.compare
# @brief Compares to values numerically (substration)
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
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inNumber1      | number        | in       |            | The first number to compare.          |
# | $2     | inNumber2      | number        | in       |            | The second number to compare.         |
#
# @example
#    NumberUtils.compare "" ""     # failure - ""
#    NumberUtils.compare "0" ""    # failure - ""
#    NumberUtils.compare "1" "1"   # 0
#    NumberUtils.compare "0" "2"   # -2
#    NumberUtils.compare "2" "0"   # 2
#    NumberUtils.compare "1.2" "1" # failure - ""
#
# @stdout the value 0 if $1 == $2; a value less than 0 if $1 < $2; and a value greater than 0 if $1 > $2.
# @stderr None.
#
# @exitcode 0 When inputs are integers.
# @exitcode 1 When inputs are not integers.
NumberUtils.compare() {
  local inNumber1="$1"
  local inNumber2="$2"

  NumberUtils.isLong "$inNumber1" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inNumber2" || return "$APASH_FUNCTION_FAILURE"

  echo $((inNumber1 - inNumber2)) && return "$APASH_FUNCTION_SUCCESS"
  
  return "$APASH_FUNCTION_FAILURE"
}