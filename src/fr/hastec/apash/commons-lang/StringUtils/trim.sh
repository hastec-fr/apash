#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.trim
# @brief Remove whitespaces characters from both ends of the input string.
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
# | $1     | inString       | string        | in       |            | The string to trim.                   |
#
# ### Example
# ```bash
#    StringUtils.trim ""                 # ""
#    StringUtils.trim "     "            # ""
#    StringUtils.trim "  Hello  World  " # "Hello  World"
# ```
#
# @stdout the trimmed string.
# @stderr None.
#
# @exitcode 0 If the string can be displayed.
# @exitcode 1 Otherwise.
#/
StringUtils.trim() {
  Log.in $LINENO "$@"
  local inString="$1"
  local trimmedString=""

  trimmedString="$(echo "$inString" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  echo "$trimmedString" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
