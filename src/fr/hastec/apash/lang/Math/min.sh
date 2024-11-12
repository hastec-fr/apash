#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isParsable
apash.import fr.hastec.apash.commons-lang.BashUtils.isCommandValid

# File description ###########################################################
# @name Math.min
# @brief Returns the smaller of two number values.
# @description
#   If the arguments have the same value, the result is that same value,
#   The last input value format is returned.
#
# ### Since:
# 0.1.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [lang](../../lang.md) / [Math](../Math.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inNum1         | number        | in       |            | The first number to compare.          |
# | $2     | inNum2         | number        | in       |            | The second number to compare.         |
#
# @example
#    Math.min  ""       ""       # failure - ""
#    Math.min  "a"      "1"      # failure - ""
#    Math.min  "0"      "1"      # 0
#    Math.min  "2"      "103"    # 2
#    Math.min  "1"      "-1"     # -1
#    Math.min  "-2"     "-3"     # -3
#    Math.min  "0.123"  ".099"   # 0.099
#    Math.min  "-.123"  "0.123"  # -.123
#    Math.min  "000"    "0"      # 000
#
# @stdout Returns the smaller of two number values.
#         In case of equality, the last number format is returned.
# @stderr None.
#
# @exitcode 0 When the input strings is a parsable number.
# @exitcode 1 When the input strings are not parsable.
Math.min() {
  local inNum1="$1"
  local inNum2="$2"
  local min

  # @todo: Change the isParsable with isNumber
  NumberUtils.isParsable "$inNum1" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isParsable "$inNum2" || return "$APASH_FUNCTION_FAILURE"

  if BashUtils.isCommandValid "bc"; then
    min=$(echo "if ($inNum1 > $inNum2) 1 else 0" | bc -lq)
    if [[ $min -eq 0 ]]; then
      echo "$inNum1" && return "$APASH_FUNCTION_SUCCESS"
    else
      echo "$inNum2" && return "$APASH_FUNCTION_SUCCESS"
    fi
  else
    # @WARNING: Degraded mode (bc command not found)
    if awk -v inNum1="$inNum1" -v inNum2="$inNum2" 'BEGIN {exit !(inNum1 > inNum2)}'; then
      echo "$inNum2" && return "$APASH_FUNCTION_SUCCESS"
    else
      echo "$inNum1" && return "$APASH_FUNCTION_SUCCESS"      
    fi
  fi

  return "$APASH_FUNCTION_FAILURE"
}