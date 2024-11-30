#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.isEmpty
# @brief Checks if a string is empty ("") or not existing.
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
# | $1     | inString       | string        | in       |            | The string to check.                  |
#
# ### Example
# ```bash
#    StringUtils.isEmpty ""            # true
#    StringUtils.isEmpty "     "       # false
#    StringUtils.isEmpty "Hello World" # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
#/
StringUtils_isEmpty() {
  Log.in $LINENO "$@"
  [ -z "${1:-}" ] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  Log.out $LINENO; return "$APASH_FAILURE"
}
alias StringUtils.isEmpty="StringUtils_isEmpty"
