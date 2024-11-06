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
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
# <!-- apash.parentEnd -->
#
# ### Method Summary
# <!-- apash.summaryTableBegin -->
# | Methods                  | Brief                                 |
# |--------------------------|---------------------------------------|
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

APASH_LOG_CHANNEL_STDOUT=1
APASH_LOG_CHANNEL_STDERR=2

# Declare a global readonly associative array for log levels
declare -Ag APASH_LOG_LEVEL_STR=( \
  [$APASH_LOG_LEVEL_OFF]="OFF"     \
  [$APASH_LOG_LEVEL_FATAL]="FATAL" \
  [$APASH_LOG_LEVEL_ERROR]="ERROR" \
  [$APASH_LOG_LEVEL_WARN]="WARN"   \
  [$APASH_LOG_LEVEL_INFO]="INFO"   \
  [$APASH_LOG_LEVEL_DEBUG]="DEBUG" \
  [$APASH_LOG_LEVEL_TRACE]="TRACE" \
  [$APASH_LOG_LEVEL_ALL]="ALL")
