#!/usr/bin/env bash

# Dependencies #################################################################
apash_import fr.hastec.apash.util.Log.message
apash_import fr.hastec.apash.commons-lang.ShellUtils.getParentFunctionName

##/
# @name Log.in
# @brief Log the parent function call with its arguments.
# @description 
#   The message is mandatory pushed to error channel.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default   | Description                           |
# |--------|----------------|---------------|----------|-----------|---------------------------------------|
# | $1     | inLineNumber   | number        | in       |           | The line number of the log.           |
# | $2     | inMessage      | string        | in       |           | The message to log.                   |
#
# ### Example
# ```bash
#    Log.debug $LINENO "Hello World"  # &2: 2024-11-06T08:27:11.213+0000 [DEBUG] apash (1): Hello World
# ```
#
# @stdout None.
# @stderr The message to log.
#
# @exitcode 0 When the message has been logged.
# @exitcode 1 Otherwise.
#/
alias Log.in="Log_in"
function Log_in {
  [ "$APASH_LOG_LEVEL_TRACE" -gt "$APASH_LOG_LEVEL" ] && return "$APASH_SUCCESS"
  typeset inLineNumber="${1:-}"
  typeset parentFunction
  typeset args
  typeset arg
  shift

  parentFunction="$(APASH_LOG_LEVEL="$APASH_LOG_LEVEL_OFF" ShellUtils_getParentFunctionName || echo "Unknown")"

  for arg in "$@"; do
    args+="'$arg' "
  done

  Log_message "$APASH_LOG_LEVEL_TRACE" "$parentFunction" "$inLineNumber" "In $parentFunction $args" && return "$APASH_SUCCESS"
  return "$APASH_FAILURE"
}
