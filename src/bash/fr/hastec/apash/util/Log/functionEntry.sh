#!/usr/bin/env bash

# Dependencies ##############################################################
apash.import fr.hastec.apash.util.Log.message
apash.import fr.hastec.apash.commons-lang.BashUtils.getParentFunctionName

# File description ###########################################################
# @name Log.functionEntry
# @brief Log the parent function call with its arguments.
# @description 
#   The message is mandatory pushed to error channel.
#
# ### Since:
# 0.2.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default   | Description                           |
# |--------|----------------|---------------|----------|-----------|---------------------------------------|
# | $1     | inLineNumber   | number        | in       |           | The line number of the log.           |
# | $3     | inFunction     | string        | in       | apash     | The corresponding module of the log.  |
# | $2     | inMessage      | string        | in       |           | The message to log.                   |
#
# @example
#    Log.debug $LINENO "Hello World"  # &2: 2024-11-06T08:27:11.213+0000 [DEBUG] apash (1): Hello World
#
# @stdout None.
# @stderr The message to log.
#
# @exitcode 0 When the message has been logged.
# @exitcode 1 Otherwise.
Log.functionEntry() {
  [ "$APASH_LOG_LEVEL_TRACE" -gt "$APASH_LOG_LEVEL" ] && return "$APASH_FUNCTION_SUCCESS"
  local inLineNumber="$1"
  local inFunction
  local args
  local arg
  shift

  inFunction="$(BashUtils.getParentFunctionName)"

  for arg in "$@"; do
    args+="'$arg' "
  done

  Log.message "$APASH_LOG_LEVEL_TRACE" "$inFunction" "$inLineNumber" "$inFunction $args" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
