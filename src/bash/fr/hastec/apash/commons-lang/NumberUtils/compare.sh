#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

# File description ###########################################################
# @name NumberUtils.compare
# @brief Compares to values numerically (substration)
# @description 
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
# @example
#    NumberUtils.compare "" ""     # failure - ""
#    NumberUtils.compare "0" ""    # failure - ""
#    NumberUtils.compare "1" "1"   # 0
#    NumberUtils.compare "0" "2"   # -2
#    NumberUtils.compare "2" "0"   # 2
#    NumberUtils.compare "1.2" "1" # failure - ""
#
# @arg $1 the first number to compare
# @arg $2 the second number to compare
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