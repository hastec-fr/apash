#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log.message
apash.import fr.hastec.apash.commons-lang.ShellUtils.getParentFunctionName

##/
# @name Log.out
# @brief Log message before exiting from the calling function.
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
#
# ### Example
# ```bash
#    Log.out $LINENO "StringUtils.leftPad-002" # &2: 2024-11-06T08:27:11.213+0000 [TRACE] StringUtils.leftPad (7): Out StringUtils.leftPad-002
# ```
#
# @stdout None.
# @stderr The message to log.
#
# @exitcode 0 When the message has been logged.
# @exitcode 1 Otherwise.
#/
Log_out() {
  [ "$APASH_LOG_LEVEL_TRACE" -gt "$APASH_LOG_LEVEL" ] && return "$APASH_SUCCESS"
  local inLineNumber="${1:-}"
  local parentFunction
  local outMessage="Out"
  local args
  local arg
  shift 1

  parentFunction="$(APASH_LOG_LEVEL="$APASH_LOG_LEVEL_OFF" ShellUtils.getParentFunctionName || echo "Unknown")"

  for arg in "$@"; do
    args+="'$arg' "
  done
  [ -n "${args[*]}" ] && outMessage="$outMessage { $args}"

  Log.message "$APASH_LOG_LEVEL_TRACE" "$parentFunction" "$inLineNumber" "$outMessage" && return "$APASH_SUCCESS"
  return "$APASH_FAILURE"
}
alias Log.out="Log_out"
