#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

# File description ###########################################################
# @name NumberUtils.isLongPositive
# @brief Checks whether the String contains has the form of a valid long positive integer.
# @description 
#   Numbers with and "." will return false. Only numbers with 
#   optional minus first and digits after are considered as valid.
#
# ### Since:
# 0.2.0
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
# | $1     | inNumber       | number        | in       |            | The number to check.                  |
#
# @example
#    NumberUtils.isLongPositive "0"                    # true
#    NumberUtils.isLongPositive "1"                    # true
#    NumberUtils.isLongPositive "9223372036854775807"  # true
#    NumberUtils.isLongPositive "9223372036854775808"  # false
#    NumberUtils.isLongPositive "-1"                   # false
#    NumberUtils.isLongPositive "1.2"                  # false
#    NumberUtils.isLongPositive "a"                    # false
#    NumberUtils.isLongPositive                        # false
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input string is a long int.
# @exitcode 1 When the input string contains characters other than digits and a minus before, or is out of bound from 64bits integer.
NumberUtils.isLongPositive() {
  local inNumber="$1"
  NumberUtils.isLong "$inNumber" || return "$APASH_FUNCTION_FAILURE"
  [[ $inNumber -ge 0 ]] || return "$APASH_FUNCTION_FAILURE"
  return "$APASH_FUNCTION_SUCCESS"
}