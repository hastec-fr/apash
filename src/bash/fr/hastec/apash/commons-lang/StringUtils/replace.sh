#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.replace
# @brief Replaces all occurrences of a String within another String.
# @description
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
#    StringUtils.replace ""     ""    ""   # ""
#    StringUtils.replace ""     "a"   "d"  # ""
#    StringUtils.replace "any"  ""    "d"  # "any"
#    StringUtils.replace "any"  "a"   "de" # "deny"
#    StringUtils.replace "aba"  "a"   ""   # "b"
#    StringUtils.replace "aba"  "a"   "z"  # "zbz"
#    StringUtils.replace "aba"  "z"   "x"  # "aba"
#
# @arg $1 string The string to modify.
# @arg $2 string The substring to search.
# @arg $3 string The string which replaces the substring found.
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

  echo "${inString//"$inSubstring"/"$inReplacement"}" || return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}

