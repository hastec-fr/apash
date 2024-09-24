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
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
#    DateUtils.isDate ""                          # false
#    DateUtils.isDate "20240914"                  # false
#    DateUtils.isDate "2024-09-14T10:30"          # false
#    DateUtils.isDate "2022-03-15T14:30:45.123Z"  # true
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
  [[ "$inDate" == "$(date -u -d "$inDate" "$DateUtils_UTC_FORMAT")" ]] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}