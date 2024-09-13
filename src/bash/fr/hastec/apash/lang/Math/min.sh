#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isParsable

# File description ###########################################################
# @name NumberUtils.min
# @brief Returns the smaller of two number values.
# @description
# If the arguments have the same value, the result is that same value.
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
#    Math.min  ""       ""       # failure - ""
#    Math.min  "a"      "1"      # failure - ""
#    Math.min  "0"      "1"      # 0
#    Math.min  "2"      "103"    # 2
#    Math.min  "1"      "-1"     # -1
#    Math.min  "-2"     "-3"     # -3
#    Math.min  "0.123"  ".099"   # .099
#    Math.min  "-.123"  "0.123"  # -.123
#    Math.min  "000"    "0"      # 0
#
# @arg $1 number The first number to compare.
# @arg $2 number The second number to compare.
#
# @stdout Returns the smaller of two number values.
#         In case of equality, the first number format is returned.
#         Multiple 000 are reduced to 0.
# @stderr None.
#
# @exitcode 0 When the input strings is a parsable number.
# @exitcode 1 When the input strings are not parsable.
Math.min() {
  local inNum1="$1"
  local inNum2="$2"
  local min

  # @TODO: Change the isParsable with isNumber
  NumberUtils.isParsable "$inNum1" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isParsable "$inNum2" || return "$APASH_FUNCTION_FAILURE"

  # min=$((inNum1 > inNum2 ? inNum2 : inNum1))
  min=$(echo "if ($inNum1 > $inNum2) $inNum2 else $inNum1" | bc -lq)
  echo "$min" && return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}