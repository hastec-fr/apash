#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.remove
# @brief Removes all occurrences of a substring from within the source string.
# @description An empty ("") source string will return the empty string.
# An empty ("") remove string will return the source string.
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
# @example
#    StringUtils.remove ""                   ""       # ""
#    StringUtils.remove ""                   ":"      # ""
#    StringUtils.remove "queued"             ""       # "queued"
#    StringUtils.remove "queued"             "ue"     # "qd"
#    StringUtils.remove "abab::cd:ab:ef::ab" "ab"     # "::cd::ef::"
#    StringUtils.remove "queued"             "zz"     # "queued"
#
# @arg $1 string The string to modify.
# @arg $2 string The substring to remove within the input string.
#
# @stdout the substring with the string removed if found
# @stderr None
#
# @exitcode 0 When result is displayed.
# @exitcode 1 otherwise.
StringUtils.remove() {
  local inString="$1"
  local inSubstring="$2"

  echo "${inString//"$inSubstring"/}" || return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}

