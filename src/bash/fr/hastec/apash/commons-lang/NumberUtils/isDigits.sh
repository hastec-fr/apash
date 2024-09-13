#!/usr/bin/env bash

# File description ###########################################################
# @name NumberUtils.isDigits
# @brief Checks whether the String contains only digit characters.
# @description So numbers with "-" and "." will return false.
# Because these character are not digits.
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
#    NumberUtils.isDigits ""      # false
#    NumberUtils.isDigits "a"     # false
#    NumberUtils.isDigits "a12"   # false
#    NumberUtils.isDigits "-12"   # true
#    NumberUtils.isDigits "1.2"   # false
#    NumberUtils.isDigits " 12"   # false
#    NumberUtils.isDigits "123"   # true
#    NumberUtils.isDigits "000"   # true
#
# @arg $1 number The number to analyze.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input string has only digits.
# @exitcode 1 When the input string contains characters other than digits.
NumberUtils.isDigits() {
  local inNumber="$1"

  [[ $inNumber =~ ^[0-9]+$ ]] && return "$APASH_FUNCTION_SUCCESS"
  
  return "$APASH_FUNCTION_FAILURE"
}

