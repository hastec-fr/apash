#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.lang.Math.max

# File description ###########################################################
# @name NumberUtils.max
# @brief Returns the greater value of a list of numbers.
# @description
# If the arguments have the same value, the result is that same value
# but the first number format is returned.
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
# | ${@:1} | inNumbers      | number...     | in       |            | List of number to evaluate.           |
#
# @example
#    NumberUtils.max  ""       ""       ""       # failure - ""
#    NumberUtils.max  "a"      "1"      "2"      # failure - ""
#    NumberUtils.max  "0"      "1"      ""       # failure - ""
#    NumberUtils.max  "0"      "2"      "1"      # 2
#    NumberUtils.max  "2"      "-3"     "0"      # 2
#    NumberUtils.max  "-2"     "-3"     "-4"     # -2
#    NumberUtils.max  "0.123"  ".099"   "-1"     # 0.123
#    NumberUtils.max  "-.123"  "0.123"  ".123"   # 0.123
#    NumberUtils.max  "000"    "0"      "00"     # 000
#
# @stdout Returns the greater value from a list of number.
#         In case of equality, the first number format is returned.
# @stderr None.
#
# @exitcode 0 When all inputs are parsable numbers.
# @exitcode 1 When at least one input is not a parsable.
NumberUtils.max() {
  local max="$1"

  NumberUtils.isParsable "$max" || return "$APASH_FUNCTION_FAILURE"
  shift

  for n in "$@"; do
    NumberUtils.isParsable "$n" || return "$APASH_FUNCTION_FAILURE"
    max=$(Math.max "$max" "$n" || return "$APASH_FUNCTION_FAILURE")
  done
  
  echo "$max" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}