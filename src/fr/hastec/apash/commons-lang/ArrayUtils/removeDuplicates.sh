#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.contains
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

##/
# @name ArrayUtils.removeDuplicates
# @brief Removes elements which are present multiple times in the array.
# @description
#   All remaining elements are shifted to the left.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | apash_ioArrayName    | ref(string[]) | in       |            |  Name of the array to modify.        |
#
# ### Example
# ```bash
#    myArray=("a" "b" "a" "c")
#    ArrayUtils.removeDuplicates  "myArray"    # ("a" "b" "c")
#
#    myArray=()
#    ArrayUtils.removeDuplicates  "myArray"    # ()
#
#    myArray=("a" "b" "c" "d")
#    ArrayUtils.removeDuplicates  "myArray"    # ("a" "b" "c" "d")
# ```
#
# @arg $1 ref(string[]) Name of the array to modify.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When first argument is an array.
# @exitcode 1 Otherwise.
#/
ArrayUtils.removeDuplicates() {
  Log.in $LINENO "$@"
  local apash_ioArrayName="${1:-}"
  local apash_lastIndex
  local -a apash_uniqueArray=()
  local apash_i
  
  apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_ioArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if [ "$APASH_SHELL" = "zsh" ]; then
    for ((apash_i=APASH_ARRAY_FIRST_INDEX; apash_i <= apash_lastIndex ; apash_i++)); do
      ArrayUtils.contains "apash_uniqueArray" "${${(P)apash_ioArrayName}[apash_i]}" || apash_uniqueArray+=("${${(P)apash_ioArrayName}[apash_i]}")
    done
  else
    local -n ioArray="$apash_ioArrayName"
    for ((apash_i=APASH_ARRAY_FIRST_INDEX; apash_i <= apash_lastIndex ; apash_i++)); do
      ArrayUtils.contains "apash_uniqueArray" "${ioArray[apash_i]}" || apash_uniqueArray+=( "${ioArray[apash_i]}")
    done
  fi

  ArrayUtils.clone "apash_uniqueArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}