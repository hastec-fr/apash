#!/usr/bin/env bash

# Dependencies #################################################################
apash_import fr.hastec.apash.util.Log
apash_import fr.hastec.apash.commons-lang.NumberUtils.isLong

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
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inNumber       | number        | in       |            | The number to check.                  |
#
# ### Example
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
alias NumberUtils.isLongPositive=apash_NumberUtils_isLongPositive
function NumberUtils_isLongPositive() {
  Log_in $LINENO "$@"
  typeset inNumber="${1:-}"
  NumberUtils_isLong "$inNumber" || { Log_out $LINENO; return "$APASH_FAILURE"; }
  [[ $inNumber -ge 0 ]]          || { Log_out $LINENO; return "$APASH_FAILURE"; }
  Log_out $LINENO; return "$APASH_SUCCESS"
}
