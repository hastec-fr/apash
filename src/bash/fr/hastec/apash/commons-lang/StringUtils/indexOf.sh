#!/usr/bin/env bash

# @file indexOf.sh
# @brief Finds the first index of a substring occurence within another string.
# @example
#    StringUtils.indexOf ""         ""   # => 0
#    StringUtils.indexOf "aabaabaa" ""   # => 0
#    StringUtils.indexOf "aabaabaa" "b"  # => 2
#    StringUtils.indexOf "aabaabaa" "ab" # => 1
#    StringUtils.indexOf "aabaabaa" "mn" # => -1
#
# @arg $1 string The string to check.
# @arg $2 string The substring to find within the input string.
#
# @stdout The first index of the search, -1 if no match.
# @stderr None
#
# @exitcode 0 If the index can be displayed.
# @exitcode 1 Otherwise.
#
# @see [StringUtils](../StringUtils.md)

# Functions ########################################
StringUtils.indexOf() {
  local inString="$1"
  local research="$2"
  local index=-1

  # Case when string is empty but not the research
  if [[ -z "$inString" &&  -n "$research" ]]; then
    echo "$index" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  # Case when researh is empty but not the input string
  if [[ -n "$inString" &&  -z "$research" ]]; then
    echo "0" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  # Case when both are empty
  if [[ -z "$inString" &&  -z "$research" ]]; then
    echo "0" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi  

  # Find character index in string (preffered to expr: SC2308)
  # If the number of characters remains the same, it means that no 
  # occurence has been found.
  index=${inString%%"${research}"*}
  [ ${#index} -eq ${#inString} ] && index=-1 || index=$((${#index}))

  echo "$index" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}