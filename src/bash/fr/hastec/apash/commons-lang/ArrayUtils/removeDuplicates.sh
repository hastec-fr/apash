#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.contains
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

# File description ###########################################################
# @name ArrayUtils.removeDuplicates
# @brief Removes elements which are present multiple times in the array.
# @description
#   All remaining elements are shifted to the left.
#
# ### Since:
# 0.1.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array to modify.        |
#
# #### Example
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
ArrayUtils.removeDuplicates() {
  local ioArrayName="$1"
  ArrayUtils.isArray "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  local lastIndex
  local uniqueArray=()
  lastIndex=$(ArrayUtils.getLastIndex "$ioArrayName") || return "$APASH_FUNCTION_FAILURE"

  if [ "$APASH_SHELL" = "zsh" ]; then
    for ((i=APASH_ARRAY_FIRST_INDEX; i <= lastIndex ; i++)); do
      ArrayUtils.contains "uniqueArray" "${${(P)ioArrayName}[i]}" || uniqueArray+=("${${(P)ioArrayName}[i]}")
    done
  else
    local -n ioArray="$ioArrayName"
    for ((i=APASH_ARRAY_FIRST_INDEX; i <= lastIndex ; i++)); do
      ArrayUtils.contains "uniqueArray" "${ioArray[i]}" || uniqueArray+=( "${ioArray[i]}")
    done
  fi

  ArrayUtils.clone "uniqueArray" "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  return "$APASH_FUNCTION_SUCCESS"
}