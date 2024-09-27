#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isParsable
apash.import fr.hastec.apash.commons-lang.BashUtils.isCommandValid

# File description ###########################################################
# @name Math.max
# @brief Returns the greater of two number values.
# @description
# If the arguments have the same value, the result is that same value
# but the first number format is returned.
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [lang](../../lang.md) / [Math](../Math.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
#    Math.max  ""       ""       # failure - ""
#    Math.max  "a"      "1"      # failure - ""
#    Math.max  "0"      "1"      # 1
#    Math.max  "2"      "103"    # 103
#    Math.max  "1"      "-1"     # 1
#    Math.max  "-2"     "-3"     # -2
#    Math.max  "0.123"  ".099"   # 0.123
#    Math.max  "-.123"  "0.123"  # -0.123
#    Math.max  "000"    "0"      # 000
#
# @arg $1 number The first number to compare.
# @arg $2 number The second number to compare.
#
# @stdout Returns the greater value of two number.
#         In case of equality, the first number format is returned.
# @stderr None.
#
# @exitcode 0 When the input strings is a parsable number.
# @exitcode 1 When the input strings are not parsable.
Math.max() {
  local inNum1="$1"
  local inNum2="$2"
  local max

  # @TODO: Change the isParsable with isNumber
  NumberUtils.isParsable "$inNum1" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isParsable "$inNum2" || return "$APASH_FUNCTION_FAILURE"

  if BashUtils.isCommandValid "bc"; then
    max=$(echo "if ($inNum1 < $inNum2) 0 else 1" | bc -lq)
    if [[ $max -eq 1 ]]; then
      echo "$inNum1" && return "$APASH_FUNCTION_SUCCESS"
    else
      echo "$inNum2" && return "$APASH_FUNCTION_SUCCESS"
    fi
  else
    [ "$APASH_WARNING_DEGRADED" != "disabled" ] && echo "WARNING - Degraded mode (bc command not found)" >&2
    if awk -v inNum1="$inNum1" -v inNum2="$inNum2" 'BEGIN {exit !(inNum1 < inNum2)}'; then
      echo "$inNum2" && return "$APASH_FUNCTION_SUCCESS"
    else
      echo "$inNum1" && return "$APASH_FUNCTION_SUCCESS"
    fi
  fi

  return "$APASH_FUNCTION_FAILURE"
}