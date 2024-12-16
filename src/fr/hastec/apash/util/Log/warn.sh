#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log.message
apash.import fr.hastec.apash.commons-lang.ShellUtils.getParentFunctionName

##/
# @name Log.warn
# @brief Log a message with warn level.
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
#    Log.info $LINENO "Behind you!!"  # &2: 2024-11-06T08:27:11.213+0000 [WARN] apash (1): Behind you!!
# ```
#
# @stdout None.
# @stderr The message to log.
#
# @exitcode 0 When the message has been logged.
# @exitcode 1 Otherwise.
#/
alias Log.warn="Log_warn"
function Log_warn {
  local inLineNumber="${1:-}"
  local inMessage="${2:-}"
  local inFunction="${3:-$(ShellUtils.getParentFunctionName)}"
  local inChannel="${4:-2}"

  Log.message "$APASH_LOG_LEVEL_WARN" "$inFunction" "$inLineNumber" "$inMessage" "$inChannel" && return "$APASH_SUCCESS"
  return "$APASH_FAILURE"
}
