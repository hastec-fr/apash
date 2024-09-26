#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.DateUtils.add

# File description ###########################################################
# @name DateUtils.addDays
# @brief Adds a number of days to a date returning a new object.
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
#    DateUtils.addDays ""                               ""    # failure - ""
#    DateUtils.addDays "0"                              ""    # failure - ""
#    DateUtils.addDays "2022-03-14T14:30:45.123+0200"   "1"   # 2022-03-15T14:30:45.123+0200
#    DateUtils.addDays "2022-03-14T14:30:45.123+0200"   "-1"  # 2022-03-13T14:30:45.123+0200
#    DateUtils.addDays "2022-03-14T14:30:45.123+0200"   "1.2" # failure - ""
#
# @arg $1 The date in UTC format
# @arg $2 The amount of dayd to add, may be negative. [Default=0]
#
# @stdout The new Date with the amount added.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
DateUtils.addDays() {
  local inDate="$1"
  local inAmount="${2:-0}"
  DateUtils.add "$inDate" "$inAmount" "days" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}