#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.NumberUtils.isParsable
apash.import fr.hastec.apash.commons-lang.BashUtils.isCommandValid

##/
# @name Math.min
# @brief Returns the smaller of two number values.
# @description
#   If the arguments have the same value, the result is that same value,
#   The last input value format is returned.
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
# | $1     | inNum1         | number        | in       |            | The first number to compare.          |
# | $2     | inNum2         | number        | in       |            | The second number to compare.         |
#
# ### Example
# ```bash
#    Math.min  ""       ""       # failure - ""
#    Math.min  "a"      "1"      # failure - ""
#    Math.min  "0"      "1"      # 0
#    Math.min  "2"      "103"    # 2
#    Math.min  "1"      "-1"     # -1
#    Math.min  "-2"     "-3"     # -3
#    Math.min  "0.123"  ".099"   # 0.099
#    Math.min  "-.123"  "0.123"  # -.123
#    Math.min  "000"    "0"      # 000
# ```
#
# @stdout Returns the smaller of two number values.
#         In case of equality, the last number format is returned.
# @stderr None.
#
# @exitcode 0 When the input strings is a parsable number.
# @exitcode 1 When the input strings are not parsable.
#/
Math.min() {
  Log.in $LINENO "$@"
  local inNum1="${1:-}"
  local inNum2="${2:-}"
  local min

  # @todo: Change the isParsable with isNumber
  NumberUtils.isParsable "$inNum1" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  NumberUtils.isParsable "$inNum2" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if BashUtils.isCommandValid "bc"; then
    min=$(echo "if ($inNum1 > $inNum2) 1 else 0" | bc -lq)
    if [[ $min -eq 0 ]]; then
      echo "$inNum1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    else
      echo "$inNum2" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    fi
  else
    [ "$APASH_LOG_WARNING_DEGRADED" = "true" ] && Log.warn $LINENO "**DEGRADED MODE** bc command not found."
    if awk -v inNum1="$inNum1" -v inNum2="$inNum2" 'BEGIN {exit !(inNum1 > inNum2)}'; then
      echo "$inNum2" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    else
      echo "$inNum1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }  
    fi
  fi

  Log.out $LINENO; return "$APASH_FAILURE"
}
