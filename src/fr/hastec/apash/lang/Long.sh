#!/usr/bin/env bash
# shellcheck disable=SC2034

##/
# <!-- @class -->
# @name Long
# @brief Contains related information about Long int.
# @description
#   It refers to a 64 bits integer.
#   The maximum positive long int is the maximum index that an array could have.
#   Bash uses a long as index for 64 bits systems.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# @apashSummaryTable
#/
Long_MIN_VALUE=-9223372036854775808
Long_MAX_VALUE=9223372036854775807
lang.Long() { true; }
