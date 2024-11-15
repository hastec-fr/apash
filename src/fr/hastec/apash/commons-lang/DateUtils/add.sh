#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.DateUtils.sh
apash.import fr.hastec.apash.commons-lang.DateUtils.isDate
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong
apash.import fr.hastec.apash.commons-lang.ArrayUtils.contains

##/
# @name DateUtils.add
# @brief Adds a number of specified unity to a date, returning a new date.
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
# | $2     | inAmount       | number        | in       |            | The amount of unity to add, may be negative. |
# | $3     | inType         | string        | in       |            | The type of unity to add to the date.        |
#
# ### Example
# ```bash
#    DateUtils.add ""                               ""       "hours" # failure
#    DateUtils.add "0"                              ""       "hours" # failure
#    DateUtils.add "2022-03-14T14:30:45.123+0200"   "1"      "days"  # 2022-03-15T14:30:45.123+0200
#    DateUtils.add "2022-03-14T14:30:45.123+0200"   "-1"     "days"  # 2022-03-13T14:30:45.123+0200
#    DateUtils.add "2022-03-14T14:30:45.123+0200"   "1"      "hours" # 2022-03-14T15:30:45.123+0200
#    DateUtils.add "2022-03-14T14:30:45.123+0200"   "-1"     "hours" # 2022-03-14T13:30:45.123+0200
#    DateUtils.add "2022-03-14T14:30:45.123+0200"   "1.2"    "hour"  # failure
# ```
#
# @stdout The new Date with the added amount.
# @stderr None.
#
# @exitcode 0 When are using the correct format of date and integer.
# @exitcode 1 Otherwise.
#/
DateUtils.add() {
  Log.entry "$LINENO" "$@"
  local inDate="$1"
  local inAmount="$2"
  local inType="$3"
  local amount=$inAmount
  local type="$inType"
  local types=("years" "months" "weeks" "days" "hours" "minutes" "seconds" "milliseconds")

  ArrayUtils.contains "types" "$inType" || return "$APASH_FUNCTION_FAILURE"
  DateUtils.isDate    "$inDate"         || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong  "$inAmount"       || return "$APASH_FUNCTION_FAILURE"

  # Change the unity in cas of milliseconds.
  if [ "$inType" = "milliseconds" ]; then
    type="seconds"
    amount=$(printf "%.3f\n" "$(echo "scale=3; $inAmount / 1000" | bc)")
  fi

  date -d "$inDate + $amount $type" "$DateUtils_UTC_FORMAT" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
