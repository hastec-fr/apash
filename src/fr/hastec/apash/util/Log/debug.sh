#!/usr/bin/env bash

# Dependencies ##############################################################
apash.import fr.hastec.apash.util.Log.message
apash.import fr.hastec.apash.commons-lang.BashUtils.getParentFunctionName

# File description ###########################################################
# @name Log.debug
# @brief Log a message with debug level
# @description 
#   By default the message is pushed to the error channel.
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
# | $2     | inMessage      | string        | in       |           | The message to log.                   |
# | $3     | inFunction     | string        | in       | apash     | The corresponding module of the log.  |
# | $4     | inChannel      | number        | in       | 2         | The number to check.                  |
#
# @example
#    Log.debug $LINENO "Hello World"  # &2: 2024-11-06T08:27:11.213+0000 [DEBUG] apash (1): Hello World
#
# @stdout None.
# @stderr The message to log.
#
# @exitcode 0 When the message has been logged.
# @exitcode 1 Otherwise.
Log.debug() {
  local inLineNumber="$1"
  local inMessage="$2"
  local inFunction="${3:-$(BashUtils.getParentFunctionName)}"
  local inChannel="${4:-2}"

  Log.message "$APASH_LOG_LEVEL_DEBUG" "$inFunction" "$inLineNumber" "$inMessage" "$inChannel" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
