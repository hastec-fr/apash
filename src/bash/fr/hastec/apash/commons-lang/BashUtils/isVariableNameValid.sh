#!/usr/bin/env bash

# File description ###########################################################
# @name BashUtils.isVariableNameValid
# @brief Defensive programming technique to check that a variable name is valid
#
# @description
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
#    BashUtils.isVariableNameValid  ""                # false
#    BashUtils.isVariableNameValid  "123"             # false
#    BashUtils.isVariableNameValid  "1myVar"          # false
#    BashUtils.isVariableNameValid  "my Var"          # false
#    BashUtils.isVariableNameValid  " myVar"          # false
#    BashUtils.isVariableNameValid  "myVar "          # false
#    BashUtils.isVariableNameValid  "my#Var"          # false
#    BashUtils.isVariableNameValid  "myVér"           # false
#    BashUtils.isVariableNameValid  "_myVar"          # true
#    BashUtils.isVariableNameValid  "myVar"           # true
#    BashUtils.isVariableNameValid  "myVar1"          # true
#    BashUtils.isVariableNameValid  "my_Var1"         # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the name is correct.
# @exitcode 1 Otherwise.
BashUtils.isVariableNameValid() {
  local varName="$1"

  # If there is a single _, it does not
  [ "$varName" = "_" ] && return "$APASH_FUNCTION_FAILURE"

  # Restrict locally name to ASCII letters (prevent issue on accents by example)
  local LC_COLLATE=C
  [[ "$varName" =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]] && return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}
