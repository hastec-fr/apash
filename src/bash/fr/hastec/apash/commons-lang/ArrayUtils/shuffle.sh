#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.swap
apash.import fr.hastec.apash.util.Random.nextInt

# File description ###########################################################
# @name ArrayUtils.shuffle
# @brief Randomly permutes the elements of the specified array randomness.
#
# @description
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Example
# ```bash
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.shuffle    "myArray"                 # ("b" "a"  "d" "c")
#    ArrayUtils.shuffle    "myArray"                 # ("a" "b" "d" "c")
# ```
#
# @arg $1 ref(string[]) Name of the array to shuffle. [Default: N/A]
#
# @stdout None.
# @stderr None.
#
# @see https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286
# @exitcode 0 When the array is shuffled.
# @exitcode 1 When the input is not an array.
ArrayUtils.shuffle() {
  local ioArrayRef="$1"
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"
  local -n inArray="$ioArrayRef"
  local i=0
  
  for (( i = ${#inArray[@]} ; i > 1 ; i-- )); do
    ArrayUtils.swap "$ioArrayRef" $((i - 1)) "$(Random.nextInt 0 $i)"
  done

  return "$APASH_FUNCTION_SUCCESS"
}