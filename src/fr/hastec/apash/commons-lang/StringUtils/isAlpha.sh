#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.isAlpha
# @brief Checks if the input string contains only Unicode letters.
# @description 
#   An empty string will return false.
#
# ### Since:
# 0.1.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inString       | string        | in       |            | The string to check.                  |
#
# @example
#    StringUtils.isAlpha ""            # false
#    StringUtils.isAlpha "     "       # false
#    StringUtils.isAlpha "abc"         # true
#    StringUtils.isAlpha "ab2c"        # false
#    StringUtils.isAlpha "ab-c"        # false
#    StringUtils.isAlpha "abéc"        # true
#
# @stdout None.
# @stderr None
#
# @exitcode 0 If the input string contains only unicode letters
# @exitcode 1 contains other things than letters.
StringUtils.isAlpha() {
  local pattern="^[[:alpha:]]+$"
  [[ $1 =~ $pattern ]] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
