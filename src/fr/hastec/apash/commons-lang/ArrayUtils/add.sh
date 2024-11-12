#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
[ "$APASH_SHELL" = "zsh" ] && apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

# File description ###########################################################
# @name ArrayUtils.add
# @brief Adds a given element at the end of an array.
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
# | #  | varName        | Type          | in/out   | Default    | Description                          |
# |----|----------------|---------------|----------|------------|--------------------------------------|
# | $1 | ioArrayName    | ref(string[]) | in & out |            | Name of the array to modify.         |
# | $2 | inValue        | string        | in       |            | Value to add at the end of the array.|
#
# #### Example
# ```bash
#    ArrayUtils.add  "myArray"              # failure
#    ArrayUtils.add  "myArray"  "a"         # ("a")
#    ArrayUtils.add  "myArray"  "b"         # ("a" "b")
#    ArrayUtils.add  "myArray"  ""          # ("a" "b" "")
#    ArrayUtils.add  "myArray"  "foo bar"   # ("a" "b" "" "foo bar")
#    ArrayUtils.add  "myArray"  "c" "d"     # failure
# ```
#
# @stdout None.
# @stderr None.
#
# @see For adding element in the middle of an array, please check [insert](./insert.md) method.
#
# @exitcode 0 When first argument is an array and the value is not an embedded array or map.
# @exitcode 1 Otherwise.
ArrayUtils.add() {
  [ $# -ne 2 ] && return "$APASH_FUNCTION_FAILURE"

  local ioArrayName="$1"
  ArrayUtils.nullToEmpty "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  local inValue="$2"

  if [ "$APASH_SHELL" = "zsh" ]; then
    local outArray=()
    ArrayUtils.clone "$ioArrayName" "outArray" || return "$APASH_FUNCTION_FAILURE"
    outArray+=("$inValue")                     || return "$APASH_FUNCTION_FAILURE"
    ArrayUtils.clone "outArray" "$ioArrayName" && return "$APASH_FUNCTION_SUCCESS"
  else
    local -n inArray="$ioArrayName"
    inArray+=("$inValue") && return "$APASH_FUNCTION_SUCCESS"
  fi
  
  return "$APASH_FUNCTION_FAILURE"
}