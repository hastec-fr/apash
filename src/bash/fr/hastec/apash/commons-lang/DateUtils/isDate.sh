#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.DateUtils.sh

# File description ###########################################################
# @name DateUtils.isDate
# @brief Check if the input string has an UTC valid format (used accross all apash date functions)
# @description
#     Let the date command trying to parse the value.
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
#    DateUtils.isDate ""                              # false
#    DateUtils.isDate "20240914"                      # false
#    DateUtils.isDate "2024-09-14T10:30"              # false
#    DateUtils.isDate "2022-03-15T14:30:45.123+0000"  # true
#
# @arg $1 The date in UTC format
# @arg $2 The amount to add, may be negative. [Default=0]
#
# @stdout The new Date with the amount added.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
DateUtils.isDate() {
  local inDate="$1"
  local datePattern="^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}\+[0-9]{4}$"

  [[ ! $inDate =~ $datePattern ]] && return "$APASH_FUNCTION_FAILURE"
  date -d "$inDate" > /dev/null 2>&1 && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}