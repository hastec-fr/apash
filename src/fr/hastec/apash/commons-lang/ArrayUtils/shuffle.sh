#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.swap
apash.import fr.hastec.apash.util.Random.nextInt

##/
# @name ArrayUtils.shuffle
# @brief Randomly permutes the elements of the specified array randomness.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default         | Description                          |
# |--------|----------------|---------------|----------|-----------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | in & out |                 |  Name of the array to shuffle.       |
#
# #### Example
# ```bash
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.shuffle    "myArray"                 # ("b" "a"  "d" "c")
#    ArrayUtils.shuffle    "myArray"                 # ("a" "b" "d" "c")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is shuffled.
# @exitcode 1 When the input is not an array.
#
# @see https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286
#/
ArrayUtils.shuffle() {
  Log.entry "$LINENO" "$@"
  local ioArrayName="$1"
  local i=0
  
  local outArray=()
  ArrayUtils.clone "$ioArrayName" "outArray" || return "$APASH_FUNCTION_FAILURE"
  
  for (( i = ${#outArray[@]} ; i > 1 ; i-- )); do
    ArrayUtils.swap "outArray" $((i - 1)) "$(Random.nextInt 0 $i)"
  done

  ArrayUtils.clone "outArray" "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}
