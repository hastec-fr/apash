#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log

##/
# @name NumberUtils.isParsable
# @brief Checks whether the given String is a parsable number.
# @description 
#   Parsable numbers include those Strings having potential minus in front,
#   only digits and a potential ".". Hexadecimal and scientific notations are not considered parsable
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
#    NumberUtils.isParsable  ""       # false
#    NumberUtils.isParsable  "a"      # false
#    NumberUtils.isParsable  "a12"    # false
#    NumberUtils.isParsable  "-12"    # true
#    NumberUtils.isParsable  "--12"   # false
#    NumberUtils.isParsable  "1-2"    # false
#    NumberUtils.isParsable  "1.2"    # true
#    NumberUtils.isParsable  " 12"    # false
#    NumberUtils.isParsable  "123"    # true
#    NumberUtils.isParsable  "000"    # true
#    NumberUtils.isParsable  "1."     # false
#    NumberUtils.isParsable  ".1"     # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input string is a parsable number.
# @exitcode 1 When the input string contains characters other than digits and a minus before and a potential dot with meaning numbers.
#/
NumberUtils.isParsable() {
  Log.entry "$LINENO" "$@"
  local inNumber="$1"
  local pattern="^-?[0-9]*\.?[0-9]+$"

  [[ $inNumber =~ $pattern ]] && return "$APASH_FUNCTION_SUCCESS"
  
  return "$APASH_FUNCTION_FAILURE"
}
