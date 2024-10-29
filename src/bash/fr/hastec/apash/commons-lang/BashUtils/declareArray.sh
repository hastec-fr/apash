#!/usr/bin/env bash

# File description ###########################################################
# @name BashUtils.declareArray
# @brief Declare an array at global level with dynamic name.
# @description
#   In bash (4.3), the parentheses are required to ensure that array is initialized
#
# ### Since:
# 0.2.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | varName        | string        | in       |            | Variable name to check.               |
#
# #### Example
# ```bash
#    BashUtils.declareArray  "myArray"       # myArray=()
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the variable is declared.
# @exitcode 1 Otherwise.
BashUtils.declareArray() {
  local varName="$1"
  if [ "$APASH_SHELL" = "zsh" ]; then
    declare -g -a "$varName" && return "$APASH_FUNCTION_SUCCESS"
  else # bash
    declare -g -a "$varName=()" && return "$APASH_FUNCTION_SUCCESS"
  fi
  return "$APASH_FUNCTION_FAILURE"
}
