#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.StringUtils.trim

##/
# @name StringUtils.isBlank
# @brief Checks if a string contains only whitespaces characters or is empty or not existing.
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
#    StringUtils.isBlank ""            # true
#    StringUtils.isBlank "     "       # true
#    StringUtils.isBlank "Hello World" # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
#/
StringUtils.isBlank() {
  Log.in $LINENO "$@"
  local inString="${1:-}"
  local trimmedString  
  trimmedString=$(StringUtils.trim "$inString") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  [ -z "$trimmedString" ] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  Log.out $LINENO; return "$APASH_FAILURE"
}
