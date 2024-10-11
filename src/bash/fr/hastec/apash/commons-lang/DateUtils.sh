#!/usr/bin/env bash
# shellcheck disable=SC2034
# <!-- @class -->
# @name DateUtils
# @brief Operations on dates.
# @description
#   This implementation do reference to the [java apache implementation](https://commons.apache.org/proper/commons-lang/javadocs/api-release/org/apache/commons/lang3/time/DateUtils.html)
#   The date should be always a string in UTC format before any manipulations:
#   ```bash
#       date -u +"%FT%T.%3N%z"
#   ```
#
# ### Since:
# 0.1.0
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../.md) / [apash](../../apash.md) / [commons-lang](../commons-lang.md) / 
# <!-- apash.parentEnd -->
#
# 
# ### Method Summary
# <!-- apash.summaryTableBegin -->
# | Methods                  | Brief                                 |
# |--------------------------|---------------------------------------|
# |[add](DateUtils/add.md)|Adds a number of specified unity to a date, returning a new date.|
# |[addDays](DateUtils/addDays.md)|Adds a number of days to a date returning a new date.|
# |[addHours](DateUtils/addHours.md)|Adds a number of hours to a date returning a new date.|
# |[addMinutes](DateUtils/addMinutes.md)|Adds a number of hours to a date returning a new date.|
# |[addMonths](DateUtils/addMonths.md)|Adds a number of hours to a date returning a new date.|
# |[addSeconds](DateUtils/addSeconds.md)|Adds a number of seconds to a date returning a new date.|
# |[addWeeks](DateUtils/addWeeks.md)|Adds a number of weeks to a date returning a new date.|
# |[addYears](DateUtils/addYears.md)|Adds a number of years to a date returning a new date.|
# |[isDate](DateUtils/isDate.md)|Check if the input string has an UTC valid format (used accross all apash date functions)|
# <!-- apash.summaryTableEnd -->

DateUtils_UTC_FORMAT="+%FT%T.%3N%z"
