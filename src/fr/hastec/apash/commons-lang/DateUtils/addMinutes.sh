#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.DateUtils.add

##/
# @name DateUtils.addMinutes
# @brief Adds a number of hours to a date returning a new date.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inDate         | date          | in       |            | The date in UTC format.               |
# | $2 ?   | inAmount       | number        | in       | 0          | The amount of minutes to add, may be negative. |
#
# ### Example
# ```bash
#    DateUtils.addMinutes ""                               ""    # failure - ""
#    DateUtils.addMinutes "0"                              ""    # failure - ""
#    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "1"   # 2022-03-14T14:01:00.123+0200
#    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "-1"  # 2022-03-13T13:59:00.123+0200
#    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "60"  # 2022-03-13T15:00:00.123+0200
#    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "1.2" # failure - ""
# ```
#
# @stdout The new Date with the added amount of minutes.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
#/
DateUtils.addMinutes() {
  local inDate="$1"
  local inAmount="${2:-0}"
  DateUtils.add "$inDate" "$inAmount" "minutes" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
