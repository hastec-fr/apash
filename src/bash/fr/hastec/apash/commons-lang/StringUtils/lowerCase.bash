#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.VersionUtils.isLowerOrEquals

# File description ###########################################################
# @name StringUtils.lowerCase
# @brief Converts a String to lower case.
# @description
#   Demo of the way to include different version of bash in same file.
# ### Since:
# 0.2.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
# <!-- apash.parentEnd -->
StringUtils.lowerCase() {
  local inString="$1"
  echo "${inString,,}" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
