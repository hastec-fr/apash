#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.DateUtils.add

# File description ###########################################################
# @name DateUtils.addHours
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
#    DateUtils.addHours ""                               ""    # failure - ""
#    DateUtils.addHours "0"                              ""    # failure - ""
#    DateUtils.addHours "2022-03-14T14:30:45.123+0200"   "1"   # 2022-03-14T15:30:45.123+0200
#    DateUtils.addHours "2022-03-14T14:30:45.123+0200"   "-1"  # 2022-03-13T13:30:45.123+0200
#    DateUtils.addHours "2022-03-14T14:30:45.123+0200"   "1.2" # failure - ""
#
# @arg $1 The date in UTC format
# @arg $2 The amount of hours to add, may be negative. [Default=0]
#
# @stdout The new Date with the amount added.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
DateUtils.addHours() {
  local inDate="$1"
  local inAmount="${2:-0}"
  DateUtils.add "$inDate" "$inAmount" "hours" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}