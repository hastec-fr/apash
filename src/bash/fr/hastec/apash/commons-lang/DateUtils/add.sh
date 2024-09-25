#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.DateUtils.sh
apash.import fr.hastec.apash.commons-lang.NumberUtils.isInteger
apash.import fr.hastec.apash.commons-lang.ArrayUtils.contains

# File description ###########################################################
# @name DateUtils.addHours
# @brief Adds a number of specified unity to a date returning a new date.
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
#    DateUtils.add ""                               ""       "hours" # failure - ""
#    DateUtils.add "0"                              ""       "hours" # failure - ""
#    DateUtils.add "2022-03-14T14:30:45.123+0200"   "1"      "days"  # 2022-03-15T14:30:45.123+0200
#    DateUtils.add "2022-03-14T14:30:45.123+0200"   "-1"     "days"  # 2022-03-13T14:30:45.123+0200
#    DateUtils.add "2022-03-14T14:30:45.123+0200"   "1"      "hours" # 2022-03-14T15:30:45.123+0200
#    DateUtils.add "2022-03-14T14:30:45.123+0200"   "-1"     "hours" # 2022-03-14T13:30:45.123+0200
#    DateUtils.add "2022-03-14T14:30:45.123+0200"   "1.2"    "hour"  # failure - ""
#
# @arg $1 The date in UTC format
# @arg $2 The amount of hours to add, may be negative. [Default=0]
# @arg $3 The type of unity to add to the date. [Default=N/A]
#
# @stdout The new Date with the amount added.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
DateUtils.add() {
  local inDate="$1"
  local inAmount="${2:-0}"
  local inType="$3"
  local amount=$inAmount
  local type="$inType"
  local types=("years" "months" "weeks" "days" "hours" "minutes" "seconds" "milliseconds")

  ArrayUtils.contains "types" "$inType" || return "$APASH_FUNCTION_FAILURE"
  DateUtils.isDate "$inDate"            || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isInteger "$inAmount"     || return "$APASH_FUNCTION_FAILURE"

  # Change the unity in cas of milliseconds.
  if [ "$inType" = "milliseconds" ]; then
    type="seconds"
    amount=$(printf "%.3f\n" "$(echo "scale=3; $inAmount / 1000" | bc)")
  fi

  date -d "$inDate + $amount $type" "$DateUtils_UTC_FORMAT" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}