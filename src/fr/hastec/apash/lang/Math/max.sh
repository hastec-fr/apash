#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.NumberUtils.isParsable
apash.import fr.hastec.apash.commons-lang.BashUtils.isCommandValid

##/
# @name Math.max
# @brief Returns the greater of two number values.
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
# | $1     | inNum1         | number        | in       |            | The first number to compare.          |
# | $2     | inNum2         | number        | in       |            | The second number to compare.         |
#
# ### Example
# ```bash
#    Math.max  ""       ""       # failure - ""
#    Math.max  "a"      "1"      # failure - ""
#    Math.max  "0"      "1"      # 1
#    Math.max  "2"      "103"    # 103
#    Math.max  "1"      "-1"     # 1
#    Math.max  "-2"     "-3"     # -2
#    Math.max  "0.123"  ".099"   # 0.123
#    Math.max  "-.123"  "0.123"  # -0.123
#    Math.max  "000"    "0"      # 000
# ```
#
# @stdout Returns the greater value of two number.
#         In case of equality, the first number format is returned.
# @stderr None.
#
# @exitcode 0 When the input strings is a parsable number.
# @exitcode 1 When the input strings are not parsable.
#/
Math.max() {
  Log.in $LINENO "$@"
  local inNum1="$1"
  local inNum2="$2"
  local max

  # @todo: Change the isParsable with isNumber
  NumberUtils.isParsable "$inNum1" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  NumberUtils.isParsable "$inNum2" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if BashUtils.isCommandValid "bc"; then
    max=$(echo "if ($inNum1 < $inNum2) 0 else 1" | bc -lq)
    if [[ $max -eq 1 ]]; then
      echo "$inNum1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    else
      echo "$inNum2" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    fi
  else
    # @WARNING: Degraded mode (bc command not found)
    if awk -v inNum1="$inNum1" -v inNum2="$inNum2" 'BEGIN {exit !(inNum1 < inNum2)}'; then
      echo "$inNum2" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    else
      echo "$inNum1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    fi
  fi

  Log.out $LINENO; return "$APASH_FAILURE"
}
