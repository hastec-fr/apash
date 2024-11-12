#!/usr/bin/env bash

# Dependencies ##############################################################
apash.import fr.hastec.apash.util.Log.message
apash.import fr.hastec.apash.commons-lang.BashUtils.getParentFunctionName

# File description ###########################################################
# @name Log.exit
# @brief Log message before exiting from the calling function.
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
# | $2     | inLabel        | string        | in       |           | The corresponding exit label.         |
#
# @example
#    Log.exit "$LINENO" "StringUtils.leftPad-002" # &2: 2024-11-06T08:27:11.213+0000 [TRACE] StringUtils.leftPad (7): Out StringUtils.leftPad-002
#
# @stdout None.
# @stderr The message to log.
#
# @exitcode 0 When the message has been logged.
# @exitcode 1 Otherwise.
Log.exit() {
  [ "$APASH_LOG_LEVEL_TRACE" -gt "$APASH_LOG_LEVEL" ] && return "$APASH_FUNCTION_SUCCESS"
  local inLineNumber="$1"
  local inLabel="$2"
  local parentFunction
  local outMessage="Out $inLabel"
  local args
  local arg
  shift 2

  parentFunction="$(BashUtils.getParentFunctionName)"

  for arg in "$@"; do
    args+="'$arg' "
  done
  [ -n "${args[*]}" ] && outMessage="$outMessage { $args}"

  Log.message "$APASH_LOG_LEVEL_TRACE" "$parentFunction" "$inLineNumber" "$outMessage" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}