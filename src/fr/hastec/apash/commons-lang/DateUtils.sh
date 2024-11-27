#!/usr/bin/env bash
# shellcheck disable=SC2034

##/
# <!-- @class -->
# @name DateUtils
# @brief Operations on dates.
# @description
#   This implementation do reference to the [java apache implementation](https://commons.apache.org/proper/commons-lang/javadocs/api-release/org/apache/commons/lang3/time/DateUtils.html)
#   The date should be always a string in UTC format before any manipulations:
#   ```bash
#       date +"%FT%T.%3N%z"
#   ```
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
# 
# @apashSummaryTable
#/
DateUtils_UTC_FORMAT="+%FT%T.%3N%z"
commons-lang.DateUtils() { true; }
