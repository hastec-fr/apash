#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.DateUtils.add

##/
# @name DateUtils.addSeconds
# @brief Adds a number of seconds to a date returning a new date.
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
# | $2 ?   | inAmount       | number        | in       | 0          | The amount of seconds to add, may be negative. |
#
# ### Example
# ```bash
#    DateUtils.addSeconds ""                               ""    # failure
#    DateUtils.addSeconds "0"                              ""    # failure
#    DateUtils.addSeconds "2024-04-01T14:00:00.123+0200"   "1"   # 2024-04-01T14:00:00.123+0200
#    DateUtils.addSeconds "2024-04-01T14:00:00.123+0200"   "-1"  # 2024-04-01T13:59:59.123+0200
#    DateUtils.addSeconds "2024-04-01T14:00:00.123+0200"   "60"  # 2024-04-01T14:01:00.123+0200
#    DateUtils.addSeconds "2024-04-01T14:00:00.123+0200"   "1.2" # failure
#```
#
# @stdout The new Date with the added amount of seconds.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
#/
DateUtils.addSeconds() {
  Log.entry "$LINENO" "$@"
  local inDate="$1"
  local inAmount="${2:-0}"
  DateUtils.add "$inDate" "$inAmount" "seconds" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
