#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.lang.Long.sh

# File description ###########################################################
# @name NumberUtils.isLong
# @brief Checks whether the String contains has the form of a valid long integer.
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
#    NumberUtils.isLong ""                      # false
#    NumberUtils.isLong "a"                     # false
#    NumberUtils.isLong "a12"                   # false
#    NumberUtils.isLong "-12"                   # true
#    NumberUtils.isLong "--12"                  # false
#    NumberUtils.isLong "1-2"                   # false
#    NumberUtils.isLong "1.2"                   # false
#    NumberUtils.isLong " 12"                   # false
#    NumberUtils.isLong "123"                   # true
#    NumberUtils.isLong "000"                   # true
#    NumberUtils.isLong "-9223372036854775808"  # true
#    NumberUtils.isLong "9223372036854775807"   # true
#    NumberUtils.isLong "9223372036854775808"   # false
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input string is a long integer.
# @exitcode 1 When the input string contains characters other than digits and a minus before, or is out of bound from 64bits integer.
NumberUtils.isLong() {
  local inNumber="$1"

  # Limit the number near the max number of characters.
  [[ ! $inNumber =~ ^-?[0-9]{1,19}$ ]] && return "$APASH_FUNCTION_FAILURE"
  
  # Check that litterally the number is not greater with a maximum of digits.
  [[ "${inNumber:0:1}" = "-"  && ${#inNumber} -eq 20 && "$inNumber" > "$Long_MIN_VALUE" ]] && return "$APASH_FUNCTION_FAILURE"
  [[ "${inNumber:0:1}" != "-" && ${#inNumber} -eq 19 && "$inNumber" > "$Long_MAX_VALUE" ]] && return "$APASH_FUNCTION_FAILURE"   
  
  return "$APASH_FUNCTION_SUCCESS"
}