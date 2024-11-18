#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.DateUtils.add

##/
# @name DateUtils.addWeeks
# @brief Adds a number of weeks to a date returning a new date.
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
#    DateUtils.addWeeks ""                               ""    # failure
#    DateUtils.addWeeks "0"                              ""    # failure
#    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "1"   # 2024-04-08T14:00:00.123+0200
#    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "-1"  # 2024-03-25T14:00:00.123+0100
#    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "5"   # 2024-05-05T14:00:00.123+0200
#    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "1.2" # failure
# ```
#
# @stdout The new Date with the added amount of seconds.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
#/
DateUtils.addWeeks() {
  Log.in $LINENO "$@"
  local inDate="$1"
  local inAmount="${2:-0}"
  DateUtils.add "$inDate" "$inAmount" "weeks" || { Log.out $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
