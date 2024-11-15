#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.lang.Integer.sh

##/
# @name NumberUtils.isInteger
# @brief Checks whether the String contains has the form of a valid integer.
# @description 
#   So numbers with and "." will return false. Only numbers with 
#   optional minus first and digits after are considered as valid.
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
# | $1     | inNumber       | number        | in       |            | The number to check.                  |
#
# ### Example
# ```bash
#    NumberUtils.isInteger ""             # false
#    NumberUtils.isInteger "a"            # false
#    NumberUtils.isInteger "a12"          # false
#    NumberUtils.isInteger "-12"          # true
#    NumberUtils.isInteger "--12"         # false
#    NumberUtils.isInteger "1-2"          # false
#    NumberUtils.isInteger "1.2"          # false
#    NumberUtils.isInteger " 12"          # false
#    NumberUtils.isInteger "123"          # true
#    NumberUtils.isInteger "000"          # true
#    NumberUtils.isInteger "2147483647"   # true
#    NumberUtils.isInteger "-2147483648"  # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input string is an integer.
# @exitcode 1 When the input string contains characters other than digits and a minus before, or is out of bound from 32bits Integer.
#/
NumberUtils.isInteger() {
  Log.entry "$LINENO" "$@"
  local inNumber="$1"

  [[ ! $inNumber =~ ^-?[0-9]+$ ]] && return "$APASH_FUNCTION_FAILURE"
  [[ $inNumber -gt $Integer_MAX_VALUE ]] && return "$APASH_FUNCTION_FAILURE"
  [[ $inNumber -lt $Integer_MIN_VALUE ]] && return "$APASH_FUNCTION_FAILURE"
  
  return "$APASH_FUNCTION_SUCCESS"
}
