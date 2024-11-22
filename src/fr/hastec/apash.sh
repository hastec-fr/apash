#!/usr/bin/env bash

##/
# <!-- @package -->
# @name apash
# @brief Translation for shell scripts of some apache libraries and more.
# @description
#   Provides highly reusable utility methods.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# @apashSummaryTable
#/
# Declare the function return codes.
export APASH_SUCCESS=0
export APASH_FAILURE=1

# Declare the bounds of the array indexes.
export APASH_ARRAY_FIRST_INDEX=0
export APASH_ARRAY_LAST_INDEX=9223372036854775807

# Zsh start index at 1 and truncate values after 18 digits
if [ "$APASH_SHELL" = "zsh" ]; then
  [[ ! $(setopt) == *ksharrays* ]] && APASH_ARRAY_FIRST_INDEX=1
  APASH_ARRAY_LAST_INDEX=999999999999999999
fi
