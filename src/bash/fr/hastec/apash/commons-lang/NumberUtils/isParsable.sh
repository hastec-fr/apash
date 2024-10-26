#!/usr/bin/env bash

# File description ###########################################################
# @name NumberUtils.isParsable
# @brief Checks whether the given String is a parsable number.
# @description 
#   Parsable numbers include those Strings having potential minus in front,
#   only digits and a potential ".". Hexadecimal and scientific notations are not considered parsable
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
# | $1     | inNumber       | number        | in       |            | The number to check.                  |
#
# @example
#    NumberUtils.isParsable  ""       # false
#    NumberUtils.isParsable  "a"      # false
#    NumberUtils.isParsable  "a12"    # false
#    NumberUtils.isParsable  "-12"    # true
#    NumberUtils.isParsable  "--12"   # false
#    NumberUtils.isParsable  "1-2"    # false
#    NumberUtils.isParsable  "1.2"    # true
#    NumberUtils.isParsable  " 12"    # false
#    NumberUtils.isParsable  "123"    # true
#    NumberUtils.isParsable  "000"    # true
#    NumberUtils.isParsable  "1."     # false
#    NumberUtils.isParsable  ".1"     # true
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input string is a parsable number.
# @exitcode 1 When the input string contains characters other than digits and a minus before
#             and a potential dot with meaning numbers.
NumberUtils.isParsable() {
  local inNumber="$1"
  local pattern="^-?[0-9]*\.?[0-9]+$"

  [[ $inNumber =~ $pattern ]] && return "$APASH_FUNCTION_SUCCESS"
  
  return "$APASH_FUNCTION_FAILURE"
}