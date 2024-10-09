#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.indexOf
# @brief Finds the first index of a substring occurence within another string.
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
# | $1     | inString       | string        | in       |            | The string to check.                  |
# | $2     | inResearch     | string        | in       |            | The substring to find within the input string. |
#
# @example
#    StringUtils.indexOf ""         ""   #  0
#    StringUtils.indexOf "aabaabaa" ""   #  0
#    StringUtils.indexOf "aabaabaa" "b"  #  2
#    StringUtils.indexOf "aabaabaa" "ab" #  1
#    StringUtils.indexOf "aabaabaa" "mn" # -1
#
# @stdout The first index of the search, -1 if no match.
# @stderr None
#
# @exitcode 0 If the index can be displayed.
# @exitcode 1 Otherwise.
#
# @see [StringUtils](../StringUtils.md)
StringUtils.indexOf() {
  local inString="$1"
  local inResearch="$2"
  local index=-1

  # Case when string is empty but not the inResearch
  if [[ -z "$inString" &&  -n "$inResearch" ]]; then
    echo "$index" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  # Case when researh is empty but not the input string
  if [[ -n "$inString" &&  -z "$inResearch" ]]; then
    echo "0" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  # Case when both are empty
  if [[ -z "$inString" &&  -z "$inResearch" ]]; then
    echo "0" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi  

  # Find character index in string (preffered to expr: SC2308)
  # If the number of characters remains the same, it means that no 
  # occurence has been found.
  index=${inString%%"${inResearch}"*}
  [ ${#index} -eq ${#inString} ] && index=-1 || index=$((${#index}))

  echo "$index" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}