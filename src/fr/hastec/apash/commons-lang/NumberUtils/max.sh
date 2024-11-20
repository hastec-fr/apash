#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.lang.Math.max

##/
# @name NumberUtils.max
# @brief Returns the greater value of a list of numbers.
# @description
#   If the arguments have the same value, the result is that same value
#   but the first number format is returned.
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
# | ${@:1} | inNumbers      | number...     | in       |            | List of number to evaluate.           |
#
# ### Example
# ```bash
#    NumberUtils.max  ""       ""       ""       # failure - ""
#    NumberUtils.max  "a"      "1"      "2"      # failure - ""
#    NumberUtils.max  "0"      "1"      ""       # failure - ""
#    NumberUtils.max  "0"      "2"      "1"      # 2
#    NumberUtils.max  "2"      "-3"     "0"      # 2
#    NumberUtils.max  "-2"     "-3"     "-4"     # -2
#    NumberUtils.max  "0.123"  ".099"   "-1"     # 0.123
#    NumberUtils.max  "-.123"  "0.123"  ".123"   # 0.123
#    NumberUtils.max  "000"    "0"      "00"     # 000
# ```
#
# @stdout Returns the greater value from a list of number.
#         In case of equality, the first number format is returned.
# @stderr None.
#
# @exitcode 0 When all inputs are parsable numbers.
# @exitcode 1 When at least one input is not a parsable.
#/
NumberUtils.max() {
  Log.in $LINENO "$@"
  local max="${1:-}"

  NumberUtils.isParsable "$max" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  shift

  for n in "$@"; do
    NumberUtils.isParsable "$n" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    max=$(Math.max "$max" "$n") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  done
  
  echo "$max" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
