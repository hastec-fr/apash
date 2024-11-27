#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.DateUtils.add

##/
# @name DateUtils.addYears
# @brief Adds a number of years to a date returning a new date.
# @description 
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inDate         | date          | in       |            | The date in UTC format.               |
# | $2 ?   | inAmount       | number        | in       | 0          | The amount of weeks to add, may be negative. |
#
# ### Example
# ```bash
#    DateUtils.addYears ""                               ""    # failure - ""
#    DateUtils.addYears "0"                              ""    # failure - ""
#    DateUtils.addYears "2024-04-01T14:00:00.123+0200"   "1"   # 2025-04-01T14:00:00.123+0200
#    DateUtils.addYears "2024-04-01T14:00:00.123+0200"   "-1"  # 2023-04-01T14:00:00.123+0200
#    DateUtils.addYears "2024-04-01T14:00:00.123+0200"   "1.2" # failure - ""
# ```
#
# @stdout The new Date with the added amount of seconds.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
#/
DateUtils.addYears() {
  Log.in $LINENO "$@"
  local inDate="${1:-}"
  local inAmount="${2:-0}"
  DateUtils.add "$inDate" "$inAmount" "years" || { Log.out $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}