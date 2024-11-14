#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.DateUtils.add

##/
# @name DateUtils.addMonths
# @brief Adds a number of hours to a date returning a new date.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inDate         | date          | in       |            | The date in UTC format.               |
# | $2 ?   | inAmount       | number        | in       | 0          | The amount of months to add, may be negative. |
#
# #### Example
# ```bash
#    DateUtils.addMonths ""                               ""    # failure - ""
#    DateUtils.addMonths "0"                              ""    # failure - ""
#    DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "1"   # 2024-05-01T14:00:00.123+0200
#    DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "-1"  # 2024-03-01T14:00:00.123+0100
#    DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "12"  # 2025-04-01T14:00:00.123+0200
#    DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "1.2" # failure - ""
# ```
#
# @stdout The new Date with the added amount of months.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
#/
DateUtils.addMonths() {
  local inDate="$1"
  local inAmount="${2:-0}"
  DateUtils.add "$inDate" "$inAmount" "months" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
