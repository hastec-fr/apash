#!/usr/bin/env bash

# Dependencies #################################################################
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
# ### Arguments
# | #      | varName        | Type          | in/out   | Default         | Description                          |
# |--------|----------------|---------------|----------|-----------------|--------------------------------------|
# | $1     | apash_ioArrayName    | ref(string[]) | in & out |                 |  Name of the array to shuffle.       |
#
# ### Example
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
  Log.in $LINENO "$@"
  local apash_ioArrayName="${1:-}"
  local -i apash_i
  local -a apash_outArray=()

  ArrayUtils.clone "$apash_ioArrayName" "apash_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  for (( apash_i=${#apash_outArray[@]}; apash_i > 1; apash_i-- )); do
    ArrayUtils.swap "apash_outArray" $((apash_i - 1)) "$(Random.nextInt 0 $apash_i)" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  done

  ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
