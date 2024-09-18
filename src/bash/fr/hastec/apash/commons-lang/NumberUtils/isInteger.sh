#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.lang.Integer.sh

# File description ###########################################################
# @name NumberUtils.isInteger
# @brief Checks whether the String contains has the form of a valid integer.
# @description So numbers with and "." will return false. Only numbers with 
# optional minus first and digits after are considered as valid.
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
#    NumberUtils.isInteger ""     # false
#    NumberUtils.isInteger "a"    # false
#    NumberUtils.isInteger "a12"  # false
#    NumberUtils.isInteger "-12"  # false
#    NumberUtils.isInteger "--12" # false
#    NumberUtils.isInteger "1-2"  # false
#    NumberUtils.isInteger "1.2"  # false
#    NumberUtils.isInteger " 12"  # false
#    NumberUtils.isInteger "123"  # true
#    NumberUtils.isInteger "000"  # true
#
# @arg $1 number The number to analyze.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input string is an integer.
# @exitcode 1 When the input string contains characters other than digits and a minus before, or is out of bound from 32bits Integer.
NumberUtils.isInteger() {
  local inNumber="$1"

  [[ ! $inNumber =~ ^-?[0-9]+$ ]] && return "$APASH_FUNCTION_FAILURE"
  [[ $inNumber -gt $Integer_MAX_VALUE ]] && return "$APASH_FUNCTION_FAILURE"
  [[ $inNumber -lt $Integer_MIN_VALUE ]] && return "$APASH_FUNCTION_FAILURE"
  
  return "$APASH_FUNCTION_SUCCESS"
}