#!/usr/bin/env zsh

# File description ###########################################################
# @name StringUtils.lowerCase
# @brief Converts a String to lower case.
# @description
#   Demo of the way to include different versions of the method in multiple files.
#
# ### Since:
# 0.2.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Reference:
# For complete documentation, please refer to lowerCase.sh.
StringUtils.lowerCase() {
  local inString="$1"
  echo "${(L)inString}" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
