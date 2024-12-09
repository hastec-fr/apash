#!/usr/bin/env bash
# shellcheck disable=SC2034

# Dependencies #################################################################
apash.import fr.hastec.apash.lang.Integer.sh
apash.import fr.hastec.apash.util.Log.sh
apash.import fr.hastec.apash.commons-lang.ShellUtils.getParentFunctionName

##/
# @name LogUtils.logger
# @brief Log a message with all provided informations.
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
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inLevel        | string        | in       |            | The message to log.                   |
# | $2     | inFunction       | string        | in       |            | The corresponding module of the log.  |
# | $3     | inLineNumber   | number        | in       |            | The line number of the log.           |
# | $4     | inMessage      | string        | in       |            | The message to log.                   |
# | $5     | inChannel      | number        | in       | 2          | The number to check.                  |
#
# ### Example
# ```bash
#    LogUtils.logger $APASH_LOG_LEVEL_INFO apash $LINENO "Hello World"  # &2: 2024-11-06T08:27:11.213+0000 [INFO] apash (1): Hello World
# ```
#
# @stdout None.
# @stderr The message to log (if the channel has not been changed).
#
# @exitcode 0 When the message has been logged.
# @exitcode 1 Otherwise.
#/
Log_message() {
  local inLevel="${1:-}"
  local inFunction="${2:-}"
  local inLineNumber="${3:-}"
  local inMessage="${4:-}"
  local inChannel="${5:-$APASH_LOG_CHANNEL_STDERR}"

  local inLevelStr="${APASH_LOG_LEVEL_STR[$inLevel]}"
  [ -z "$inLevelStr" ] && inLevelStr="Custom-$inLevel"

  # Return immediatly if the provided level is greater than the Apash global log level.
  [ "$inLevel" -gt "$APASH_LOG_LEVEL" ] && return "$APASH_SUCCESS"
  
  # Prevent logging if it's in the black or white list.
  [ -n "$APASH_LOG_BLACKLIST" ] && [[   ":$APASH_LOG_BLACKLIST:" =~ :"$inFunction": ]] && return "$APASH_SUCCESS"
  [ -n "$APASH_LOG_WHITELIST" ] && [[ ! ":$APASH_LOG_WHITELIST:" =~ :"$inFunction": ]] && return "$APASH_SUCCESS"

  echo "$(date +"%FT%T.%3N%z") [$inLevelStr] $inFunction ($inLineNumber): $inMessage" >&"$inChannel" && return "$APASH_SUCCESS"

  return "$APASH_FAILURE"
}
alias Log.message="Log_message"
