#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name ShellUtils.isVariableNameValid
# @brief Defensive programming technique to check that a variable name is valid.
# @description
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
#    ShellUtils.isVariableNameValid  ""                # false
#    ShellUtils.isVariableNameValid  "123"             # false
#    ShellUtils.isVariableNameValid  "1myVar"          # false
#    ShellUtils.isVariableNameValid  "my Var"          # false
#    ShellUtils.isVariableNameValid  " myVar"          # false
#    ShellUtils.isVariableNameValid  "myVar "          # false
#    ShellUtils.isVariableNameValid  "my#Var"          # false
#    ShellUtils.isVariableNameValid  "myVér"           # false
#    ShellUtils.isVariableNameValid  "_myVar"          # true
#    ShellUtils.isVariableNameValid  "myVar"           # true
#    ShellUtils.isVariableNameValid  "myVar1"          # true
#    ShellUtils.isVariableNameValid  "my_Var1"         # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the name is correct.
# @exitcode 1 Otherwise.
#/
ShellUtils.isVariableNameValid() {
  Log.in $LINENO "$@"
  local varName="${1:-}"

  # If there is a single _, it does not
  [ "$varName" = "_" ] && { Log.out $LINENO; return "$APASH_FAILURE"; }

  # Restrict locally name to ASCII letters (prevent issue on accents by example)
  local LC_COLLATE=C
  [[ "$varName" =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]] || { Log.out $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
