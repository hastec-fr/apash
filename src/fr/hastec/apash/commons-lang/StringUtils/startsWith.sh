#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.startsWith
# @brief Check if a CharSequence starts with a specified prefix.
# @description
#   The prefix is a string (not a pattern).
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
#
# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inString       | string        | in       |            | The string to check.                  |
# | $2     | inPrefix       | string        | in       |            | The prefix to find.                   |
#
# @example
#    StringUtils.startsWith "" ""         # true
#    StringUtils.startsWith "abcd" ""     # true
#    StringUtils.startsWith "abcd" "ab"   # true
#    StringUtils.startsWith "abcd" "abd"  # false
#    StringUtils.startsWith ""     "a"    # false
#    StringUtils.startsWith "abcd" "a.c"  # false
#    StringUtils.startsWith "a.cd" "a.c"  # true
#
# #### Implementation notes
#   In zsh, pattern chararecters are interpreted even if they are between quotes.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 If the string starts with the prefix.
# @exitcode 1 Otherwise.
StringUtils.startsWith(){
  local inString=$1
  local inPrefix=$2

  if [ "$APASH_SHELL" = "zsh" ]; then
    [[ "${inString:0:${#inPrefix}}" == "$inPrefix" ]] && return "$APASH_FUNCTION_SUCCESS"
  else # bash
    # The string is between quotes to prevent the interpretation of pattern symbols.
    # @todo: startsWithPattern
    [[ $inString =~ ^"$inPrefix" ]] && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi
}