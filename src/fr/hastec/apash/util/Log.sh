#!/usr/bin/env bash
# shellcheck disable=SC2034

# Dependencies ##############################################################
apash.import fr.hastec.apash.lang.Integer.sh

# File description ###########################################################
# @name LogUtils.logger
# @brief Log a message with all provided informations
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
# [](../../../.md) / [apash](../../apash.md) / [util](../util.md) / 
# <!-- apash.parentEnd -->
#
# ### Method Summary
# <!-- apash.summaryTableBegin -->
# | Methods                  | Brief                                 |
# |--------------------------|---------------------------------------|
# |[debug](Log/debug.md)|Log a message with debug level|
# |[entry](Log/entry.md)|Log the parent function call with its arguments.|
# |[error](Log/error.md)|Log a message with error level|
# |[exception](Log/exception.md)|Log an error message due to an unexpected behavior and print the stack.|
# |[exit](Log/exit.md)|Log message before exiting from the calling function.|
# |[fatal](Log/fatal.md)|Log a message with fatal level|
# |[info](Log/info.md)|Log a message with info level|
# |[message](Log/message.md)|Log a message with all provided informations|
# |[trace](Log/trace.md)|Log a message with trace level|
# |[warn](Log/warn.md)|Log a message with warn level|
# <!-- apash.summaryTableEnd -->
APASH_LOG_LEVEL_OFF=0
APASH_LOG_LEVEL_FATAL=100
APASH_LOG_LEVEL_ERROR=200
APASH_LOG_LEVEL_WARN=300
APASH_LOG_LEVEL_INFO=400
APASH_LOG_LEVEL_DEBUG=500
APASH_LOG_LEVEL_TRACE=600
APASH_LOG_LEVEL_ALL=$Integer_MAX_VALUE
APASH_LOG_LEVEL=${APASH_LOG_LEVEL:-$APASH_LOG_LEVEL_WARN}

APASH_LOG_STACK_TRACE=${APASH_LOG_STACK_TRACE:-false}

APASH_LOG_CHANNEL_STDOUT=1
APASH_LOG_CHANNEL_STDERR=2

# Declare a global readonly associative array for log levels
declare -Ag APASH_LOG_LEVEL_STR
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_OFF]="OFF"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_FATAL]="FATAL"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_ERROR]="ERROR"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_WARN]="WARN"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_INFO]="INFO"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_DEBUG]="DEBUG"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_TRACE]="TRACE"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_ALL]="ALL"
