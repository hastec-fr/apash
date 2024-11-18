#!/usr/bin/env bash

##/
# @name BashUtils.isCommandValid
# @brief Determine if current APASH_SHELL is zsh.
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
#
# ### Example
# ```bash
#    # From bash
#    BashUtils.isZsh  ""                # false
#
#    # From zsh
#    BashUtils.isZsh  ""                # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the command name is correct.
# @exitcode 1 Otherwise.
#/
BashUtils.isZsh() {
  Log.in $LINENO "$@"
  [[ "$APASH_SHELL" == "zsh" ]] || { Log.out $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
