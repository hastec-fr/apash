#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.lang.Math.min

# File description ###########################################################
# @name NumberUtils.min
# @brief Returns the smaller value of a list of numbers.
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
#    NumberUtils.min  ""       ""       ""       # failure - ""
#    NumberUtils.min  "a"      "1"      "2"      # failure - ""
#    NumberUtils.min  "0"      "1"      ""       # failure - ""
#    NumberUtils.min  "0"      "2"      "1"      # 0
#    NumberUtils.min  "2"      "-3"     "0"      # -3
#    NumberUtils.min  "-2"     "-3"     "-4"     # -4
#    NumberUtils.min  "0.123"  ".099"   "-1"     # -1
#    NumberUtils.min  "-.123"  "-0.123"  ".123"  # -.123
#    NumberUtils.min  "000"    "0"      "00"     # 000
#
# @stdout Returns the greater value from a list of numbers.
#         In case of equality, the first number format is returned.
# @stderr None.
#
# @exitcode 0 When all inputs are parsable numbers.
# @exitcode 1 When at least one input is not a parsable.
NumberUtils.min() {
  local min="$1"

  NumberUtils.isParsable "$min" || return "$APASH_FUNCTION_FAILURE"
  shift

  for n in "$@"; do
    NumberUtils.isParsable "$n" || return "$APASH_FUNCTION_FAILURE"
    min=$(Math.min "$min" "$n" || return "$APASH_FUNCTION_FAILURE")
  done
  
  echo "$min" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}