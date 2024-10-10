#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.DateUtils.add

# File description ###########################################################
# @name DateUtils.addWeeks
# @brief Adds a number of weeks to a date returning a new date.
# @description 
#
# ### Since:
# 0.2.0
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
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inDate         | date          | in       |            | The date in UTC format.               |
# | $2 ?   | inAmount       | number        | in       | 0          | The amount of weeks to add, may be negative. |
#
# @example
#    DateUtils.addWeeks ""                               ""    # failure - ""
#    DateUtils.addWeeks "0"                              ""    # failure - ""
#    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "1"   # 2024-04-08T14:00:00.123+0200
#    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "-1"  # 2024-03-25T14:00:00.123+0100
#    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "5"   # 2024-05-05T14:00:00.123+0200
#    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "1.2" # failure - ""
#
# @stdout The new Date with the added amount of seconds.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
DateUtils.addWeeks() {
  local inDate="$1"
  local inAmount="${2:-0}"
  DateUtils.add "$inDate" "$inAmount" "weeks" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}