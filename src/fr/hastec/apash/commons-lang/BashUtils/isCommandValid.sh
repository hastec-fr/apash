#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name BashUtils.isCommandValid
# @brief Defensive programming technique to check that a variable name is valid
# @description
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | commandName    | string        | in       |            | Command to analyse                    |
#
# ### Example
# ```bash
#    BashUtils.isCommandValid  ""                # false
#    BashUtils.isCommandValid  "apashnotexist"   # false
#    BashUtils.isCommandValid  "command"         # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the command name is correct.
# @exitcode 1 Otherwise.
#/
BashUtils.isCommandValid() {
  Log.in $LINENO "$@"
  local commandName="$1"
  command -v "$commandName" >/dev/null 2>&1 || { Log.out $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS";
}
