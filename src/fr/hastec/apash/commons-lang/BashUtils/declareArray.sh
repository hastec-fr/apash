#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name BashUtils.declareArray
# @brief Declare an array at global level with dynamic name.
# @description
#   In bash (4.3), the parentheses are required to ensure that array is initialized.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | varName        | string        | in       |            | Variable name to check.               |
#
# ### Example
# ```bash
#    BashUtils.declareArray  "myArray"       # myArray=()
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the variable is declared.
# @exitcode 1 Otherwise.
#/
BashUtils.declareArray() {
  Log.entry "$LINENO" "$@"
  local varName="$1"
  if [ "$APASH_SHELL" = "zsh" ]; then
    declare -g -a "$varName" && return "$APASH_FUNCTION_SUCCESS"
  else # bash
    declare -g -a "$varName=()" && return "$APASH_FUNCTION_SUCCESS"
  fi
  return "$APASH_FUNCTION_FAILURE"
}
