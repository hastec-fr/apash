#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log.message
apash.import fr.hastec.apash.commons-lang.ShellUtils.getParentFunctionName

##/
# @name Log.error
# @brief Log a message with error level
# @description 
#   By default the message is pushed to the error channel.
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
# | $3     | inFunction     | string        | in       | apash     | The corresponding module of the log.  |
# | $4     | inChannel      | number        | in       | 2         | The number to check.                  |
#
# ### Example
# ```bash
#    Log.info $LINENO "Error in the matrix"  # &2: 2024-11-06T08:27:11.213+0000 [ERROR] apash (1): Error in the matrix
# ```
#
# @stdout None.
# @stderr The message to log.
#
# @exitcode 0 When the message has been logged.
# @exitcode 1 Otherwise.
#/
Log_error() {
  local inLineNumber="${1:-}"
  local inMessage="${2:-}"
  local inFunction="${3:-$(ShellUtils.getParentFunctionName)}"
  local inChannel="${4:-2}"

  Log.message "$APASH_LOG_LEVEL_ERROR" "$inFunction" "$inLineNumber" "$inMessage" "$inChannel" && return "$APASH_SUCCESS"
  return "$APASH_FAILURE"
}
alias Log.error="Log_error"
