#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.StringUtils.trim

# File description ###########################################################
# @name StringUtils.isBlank
# @brief Checks if a string contains only whitespaces characters or is empty or not existing.
# @description <!-- -->
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
#    StringUtils.isBlank ""            # true
#    StringUtils.isBlank "     "       # true
#    StringUtils.isBlank "Hello World" # false
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
#
# @see [StringUtils](../StringUtils.md)
StringUtils.isBlank() {
  local inString="$1"
  local trimmedString  
  trimmedString=$(StringUtils.trim "$inString")
  [ -z "$trimmedString" ] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}