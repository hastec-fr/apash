#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.DateUtils.add

# File description ###########################################################
# @name DateUtils.addMonths
# @brief Adds a number of hours to a date returning a new date.
# @description 
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [DateUtils](../DateUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
#    DateUtils.addMonths ""                               ""    # failure - ""
#    DateUtils.addMonths "0"                              ""    # failure - ""
#    DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "1"   # 2024-04-01T14:00:00.123+0200
#    DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "-1"  # 2024-03-01T14:00:00.123+0100
#    DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "12"  # 2025-04-01T14:00:00.123+0200
#    DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "1.2" # failure - ""
#
# @arg $1 The date in UTC format
# @arg $2 The amount of month to add, may be negative. [Default=0]
#
# @stdout The new Date with the amount added.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
DateUtils.addMonths() {
  local inDate="$1"
  local inAmount="${2:-0}"
  DateUtils.add "$inDate" "$inAmount" "months" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}