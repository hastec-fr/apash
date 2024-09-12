#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.isDigits
# @brief Checks whether the String contains only digit characters.
# @description So numbers with "-" and "." will return false.
# Because these character are not digits.
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
# @example
#    StringUtils.isDigits ""     # false
#    StringUtils.isDigits "a"    # false
#    StringUtils.isDigits "a12"  # false
#    StringUtils.isDigits "-12"  # false
#    StringUtils.isDigits "1.2"  # false
#    StringUtils.isDigits " 12"  # false
#    StringUtils.isDigits "123"  # true
#    StringUtils.isDigits "000"  # true
#
# @arg $1 number The number to analyse.
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

