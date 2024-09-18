#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.lang.Integer.sh
apash.import fr.hastec.apash.commons-lang.NumberUtils.isInteger

# File description ###########################################################
# @name Random.nextInt
# @brief Returns a pseudorandomly chosen int value.
#
# @description
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [util](../../util.md) / [Random](../Random.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example:
#    Random.nextInt
#    Array.sort "myArray"  # ("a" "b" "c")
#
#    myArray=("a" "c" "b")
#    Array.sort "myArray"  # ("a" "b" "c")
#
#    myArray=("beta-20" "beta-10" "beta-1")
#    Array.sort "myArray"  # ("beta-1" "beta-10" "beta-20")
#
#    myArray=("1" "a" "2" "3")
#    Array.sort "myArray"  # ("1" "2" "3" "a")
#   
#    myArray=("1" "")
#    Array.sort "myArray"  # ("" "1")
# ```
#
# @arg $1 number The least value that can be returned. [Default: N/A]
# @arg $2 number The upper bound (exclusive) for the returned value. [Default: N/A]
#
# @stdout An pseudorandomly chosen int value between the minValue (inclusive) and the maxValue (exclusive).
# @stderr None.
#
# @exitcode 0 When the number is displayed.
# @exitcode 1 If the minValue is greater than the maxValue, or numbers are not Integers.
Random.nextInt() {
  local minValue="$1"
  local maxValue="$2"
  
  [[ -z $minValue && $# -lt 1 ]] && minValue=$Integer_MIN_VALUE
  [[ -z $maxValue && $# -lt 2 ]] && maxValue=$Integer_MAX_VALUE

  NumberUtils.isInteger "$minValue" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isInteger "$maxValue" || return "$APASH_FUNCTION_FAILURE"

  [[ $minValue -gt $maxValue ]] && return "$APASH_FUNCTION_FAILURE"

  # Generate a random number within the range
  echo $(( RANDOM * (maxValue - minValue + 1) / 32768 + minValue ))

  return "$APASH_FUNCTION_SUCCESS"
}