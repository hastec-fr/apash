#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isParsable

# File description ###########################################################
# @name Math.abs
# @brief Checks whether the given String is a parsable number, then return without minus sign (absolute value).
# @description
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
# | $1     | inNumber       | number        | in       |            | The number to evaluate.               |
#
# @example
#    Math.abs  ""       # failure - ""
#    Math.abs  "a"      # failure - ""
#    Math.abs  "a12"    # failure - ""
#    Math.abs  "-12"    # 12
#    Math.abs  "--12"   # failure - ""
#    Math.abs  "1-2"    # false
#    Math.abs  "1.2"    # 1.2
#    Math.abs  " 12"    # failure - ""
#    Math.abs  "123"    # 123
#    Math.abs  "000"    # 000
#    Math.abs  "1."     # failure - ""
#    Math.abs  ".1"     # .1
#    Math.abs  "-.12"   # .12
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input string is a parsable number.
# @exitcode 1 When the input string contains characters other than digits and a minus before
#             and a potential dot with meaning numbers.
Math.abs() {
  local inNumber="$1"

  NumberUtils.isParsable "$inNumber" || return "$APASH_FUNCTION_FAILURE"
  echo "${inNumber#-}" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}