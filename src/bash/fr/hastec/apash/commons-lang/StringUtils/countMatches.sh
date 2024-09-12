#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.countMatches
# @brief Counts how many times the substring appears in the larger string.
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
#    StringUtils.countMatches ""     ""      # 0
#    StringUtils.countMatches ""     "a"     # 0
#    StringUtils.countMatches "abba"  ""     # 0
#    StringUtils.countMatches "abba"  "a"    # 2
#    StringUtils.countMatches "abba"  "ab"   # 1
#    StringUtils.countMatches "abba"  "xxx"  # 0
#
# @arg $1 string The string to check.
# @arg $2 string The substring to count.
#
# @stdout The number of occurrences, 0 if either string is empty
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
StringUtils.countMatches() {
  local inString="$1"
  local inSubstring="$2"
  local count=0

  if [[ -z $inString || -z $inSubstring ]]; then
    echo "$count" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  count=$(echo "$inString" | grep -o "$inSubstring" | wc -l)
  echo "$count" && return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}

