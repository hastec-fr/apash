#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.lowerCase
# @brief Converts a String to lower case.
# @description
#
# ### Since:
# 0.1.0
#
# ### ChangeLogs:
# - 0.2.0: Split file to .bash, .zsh and bash_4.2.53. Let the nearest POSIX code in .sh.
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
# | $1     | inString       | string        | in       |            | The string to lower case.             |
#
# @example
#    StringUtils.upperCase ""              # ""
#    StringUtils.upperCase "ABC"           # "abc"
#    StringUtils.upperCase "AbC"           # "abc"
#    StringUtils.upperCase "A123B"         # "a123b"
#    StringUtils.upperCase "abc"           # "abc"
#    StringUtils.upperCase "CRÈME BRÛLÉE"  # "crème brûlée"
#
# @arg $1 string 
#
# @stdout The lower cased string
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
StringUtils.lowerCase() {
  local inString="$1"
  echo "$inString" | awk '{print tolower($0)}' && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
