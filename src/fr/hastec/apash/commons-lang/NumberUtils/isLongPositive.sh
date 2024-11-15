#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

##/
# @name NumberUtils.isLongPositive
# @brief Checks whether the String contains has the form of a valid long positive integer.
# @description 
#   Numbers with and "." will return false. Only numbers with 
#   optional minus first and digits after are considered as valid.
#
# ## History
# @since 0.2.0 (hastec-fr)
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
#    NumberUtils.isLongPositive "0"                    # true
#    NumberUtils.isLongPositive "1"                    # true
#    NumberUtils.isLongPositive "9223372036854775807"  # true
#    NumberUtils.isLongPositive "9223372036854775808"  # false
#    NumberUtils.isLongPositive "-1"                   # false
#    NumberUtils.isLongPositive "1.2"                  # false
#    NumberUtils.isLongPositive "a"                    # false
#    NumberUtils.isLongPositive                        # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input string is a long int.
# @exitcode 1 When the input string contains characters other than digits and a minus before, or is out of bound from 64bits integer.
#/
NumberUtils.isLongPositive() {
  Log.entry "$LINENO" "$@"
  local inNumber="$1"
  NumberUtils.isLong "$inNumber" || return "$APASH_FUNCTION_FAILURE"
  [[ $inNumber -ge 0 ]] || return "$APASH_FUNCTION_FAILURE"
  return "$APASH_FUNCTION_SUCCESS"
}
