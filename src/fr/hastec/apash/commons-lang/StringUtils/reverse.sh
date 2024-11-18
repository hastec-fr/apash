#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.BashUtils.isCommandValid

##/
# @name StringUtils.reverse
# @brief Reverses a string.
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
# | $1     | inString       | string        | in       |            | The string to reverse.                |
#
# ### Example
# ```bash
#    StringUtils.reverse             # ""
#    StringUtils.reverse ""          # ""
#    StringUtils.reverse "bat"       # "tab"
#    StringUtils.reverse "bat man"   # "nam tab"
# ```
#
# @stdout The reversed string.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
#/
StringUtils.reverse() {
  Log.in $LINENO "$@"
  local inString="$1"
  local i

  if BashUtils.isCommandValid "rev"; then
    echo "$inString" | rev && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  else
    # @WARNING: Degraded mode (rev command not found)
    # Loop through the string in reverse order
    for (( i=${#inString}-1; i>=0; i-- )); do
        reversed_string="$reversed_string${inString:$i:1}"
    done
    echo "$reversed_string" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  fi

  Log.out $LINENO; return "$APASH_FAILURE"
}
