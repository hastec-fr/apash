#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.remove
# @brief Removes all occurrences of a substring from within the source string.
# @description 
#   An empty ("") source string will return the empty string.
#   An empty ("") remove string will return the source string.
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
# | $2     | inSubstring    | string        | in       |            | The substring to remove within the input string. |
#
# @example
#    StringUtils.remove ""                   ""       # ""
#    StringUtils.remove ""                   ":"      # ""
#    StringUtils.remove "queued"             ""       # "queued"
#    StringUtils.remove "queued"             "ue"     # "qd"
#    StringUtils.remove "abab::cd:ab:ef::ab" "ab"     # "::cd::ef::"
#    StringUtils.remove "queued"             "zz"     # "queued"
#
# @stdout The substring with the string removed if found.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 otherwise.
StringUtils.remove() {
  local inString="$1"
  local inSubstring="$2"

  echo "${inString//"$inSubstring"/}" || return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}

