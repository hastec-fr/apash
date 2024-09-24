#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.DateUtils.sh
apash.import fr.hastec.apash.commons-lang.NumberUtils.isInteger

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
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
#    DateUtils.addDays "" ""     # failure - ""
#    DateUtils.addDays "0" ""    # failure - ""
#    DateUtils.addDays "1" "1"   # 0
#    DateUtils.addDays "0" "2"   # -2
#    DateUtils.addDays "2" "0"   # 2
#    DateUtils.addDays "1.2" "1" # failure - ""
#
# @arg $1 The date in UTC format
# @arg $2 The amount to add, may be negative. [Default=0]
#
# @stdout The new Date with the amount added.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
DateUtils.addDays() {
  local inDate="$1"
  local inAmount="${2:-0}"

  DateUtils.isDate "$inDate" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isInteger "$inAmount" || return "$APASH_FUNCTION_FAILURE"

  date -u -d "$inDate + $inAmount day" "$DateUtils_UTC_FORMAT" && return "$APASH_FUNCTION_SUCCESS"  
  return "$APASH_FUNCTION_FAILURE"
}