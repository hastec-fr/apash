#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.DateUtils.add

# File description ###########################################################
# @name DateUtils.addMinutes
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
#    DateUtils.addMinutes ""                               ""    # failure - ""
#    DateUtils.addMinutes "0"                              ""    # failure - ""
#    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "1"   # 2022-03-14T14:01:00.123+0200
#    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "-1"  # 2022-03-13T13:59:00.123+0200
#    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "60"  # 2022-03-13T15:00:00.123+0200
#    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "1.2" # failure - ""
#
# @arg $1 The date in UTC format
# @arg $2 The amount of minute to add, may be negative. [Default=0]
#
# @stdout The new Date with the amount added.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
DateUtils.addMinutes() {
  local inDate="$1"
  local inAmount="${2:-0}"
  DateUtils.add "$inDate" "$inAmount" "minutes" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}