#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.replace
# @brief Replaces all occurrences of a String within another String.
# @description
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
# | $1     | inString       | string        | in       |            | The string to modify.                 |
# | $2     | inSubstring    | string        | in       |            | The substring to search.              |
# | $3     | inReplacement  | string        | in       |            | The string which replaces the substring found. |
#
# @example
#    StringUtils.replace ""     ""    ""   # ""
#    StringUtils.replace ""     "a"   "d"  # ""
#    StringUtils.replace "any"  ""    "d"  # "any"
#    StringUtils.replace "any"  "a"   "de" # "deny"
#    StringUtils.replace "aba"  "a"   ""   # "b"
#    StringUtils.replace "aba"  "a"   "z"  # "zbz"
#    StringUtils.replace "aba"  "z"   "x"  # "aba"
#
# @stdout The text with any replacements processed
# @stderr None
#
# @exitcode 0 When result is displayed.
# @exitcode 1 otherwise.
StringUtils.replace() {
  local inString="$1"
  local inSubstring="$2"
  local inReplacement="$3"

  [ -z "$inSubstring" ] && echo "${inString}" && return "$APASH_FUNCTION_SUCCESS"
  echo "${inString//"$inSubstring"/"$inReplacement"}" && return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}

