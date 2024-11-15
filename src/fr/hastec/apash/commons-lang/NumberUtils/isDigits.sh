#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log

##/
# @name NumberUtils.isDigits
# @brief Checks whether the String contains only digit characters.
# @description 
#   So numbers with "-" and "." will return false.
#   Because these character are not digits.
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
# | $1     | inNumber       | number        | in       |            | The number to check.                  |
#
# #### Example
# ```bash
#    NumberUtils.isDigits ""      # false
#    NumberUtils.isDigits "a"     # false
#    NumberUtils.isDigits "a12"   # false
#    NumberUtils.isDigits "-12"   # true
#    NumberUtils.isDigits "1.2"   # false
#    NumberUtils.isDigits " 12"   # false
#    NumberUtils.isDigits "123"   # true
#    NumberUtils.isDigits "000"   # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input string has only digits.
# @exitcode 1 When the input string contains characters other than digits.
#/
NumberUtils.isDigits() {
  Log.entry "$LINENO" "$@"
  local inNumber="$1"
  local pattern="^[0-9]+$"
  [[ $inNumber =~ $pattern ]] && return "$APASH_FUNCTION_SUCCESS"
  
  return "$APASH_FUNCTION_FAILURE"
}
