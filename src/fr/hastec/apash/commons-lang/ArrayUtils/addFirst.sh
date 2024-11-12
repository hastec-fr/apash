#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

# File description ###########################################################
# @name ArrayUtils.addFirst
# @brief Adds given elements at the beginning of an array.
#
# @description
#   The array is automatically created if the variable is not declared.
#   Existing variables or maps are not overriden and the function fails.
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
# | $1     | inArrayName    | ref(string[]) | in & out |            | Name of the array to modify.         |
# | ${@:2} | inValues       | string...    | in       |            | Value to add at the beginning of the array.|
#
# #### Example
# ```bash
#    ArrayUtils.addFirst  ""       ""          # failure
#
#    myVar="test"
#    ArrayUtils.addFirst  "myVar"  "a"         # ("a")
#
#    declare -A myMap
#    ArrayUtils.addFirst  "myMap"  "a"         # ("a")
#
#    myArray=()
#    ArrayUtils.addFirst  "myArray"              # failure
#    ArrayUtils.addFirst  "myArray"  "a"         # ("a")
#    ArrayUtils.addFirst  "myArray"  "b"         # ("b" "a")
#    ArrayUtils.addFirst  "myArray"  ""          # ("" "a" "b")
#    ArrayUtils.addFirst  "myArray"  "c" "d"     # failure
#    ArrayUtils.addFirst  "myArray"  "foo bar"   # ("foo bar" "" "b" "a")
# ```
#
# @stdout None.
# @stderr None.
#
# @see For adding element in the middle of an array, please check [insert](./insert.md) method.
#
# @exitcode 0 When first argument is an array and a value must be added.
# @exitcode 1 When none or more than 1 value must be added.
ArrayUtils.addFirst() {
  [ $# -ne 2 ] && return "$APASH_FUNCTION_FAILURE"
  local ref_ArrayUtilsAddFirst_inArrayName="$1"
  ArrayUtils.nullToEmpty "$ref_ArrayUtilsAddFirst_inArrayName" || return "$APASH_FUNCTION_FAILURE"

  local inValue="$2"
  local ref_ArrayUtilsAddFirst_outArray=("$inValue")
  local ref_ArrayUtilsAddFirst_inArray=()
  local i
  
  ArrayUtils.clone "$ref_ArrayUtilsAddFirst_inArrayName" "ref_ArrayUtilsAddFirst_inArray" || return "$APASH_FUNCTION_FAILURE"

  if [ "$APASH_SHELL" = "zsh" ]; then
    ref_ArrayUtilsAddFirst_outArray+=("${ref_ArrayUtilsAddFirst_inArray[@]}")
  else
    # Need to preserve indexes in bash
    for i in "${!ref_ArrayUtilsAddFirst_inArray[@]}"; do
      # shellcheck disable=SC2034
      ref_ArrayUtilsAddFirst_outArray[i+1]="${ref_ArrayUtilsAddFirst_inArray[i]}"
    done
  fi
  ArrayUtils.clone "ref_ArrayUtilsAddFirst_outArray" "$ref_ArrayUtilsAddFirst_inArrayName" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}