#!/usr/bin/env bash

# @description Finds the first index within a string
# @example
#
# @arg $1 string Input string to check
# @arg $2 the string to find
#
# @stdout The first index of the search, -1 if no match
#         or empty string input string with non empty research
# @stderr None
#
# @exitcode 0 If the index can be displayed
# @exitcode 1 Otherwise
StringUtils.indexOf() {
  local inString="$1"
  local research="$2"
  local index=-1

  # Case when string is empty but not the research
  if [[ -z "$inString" &&  -n "$research" ]]; then
    echo "$index" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  # Case when researh is empty but not the research
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
  # If the number of characters remain the same, it means that no 
  # occurence has been found.
  index=${inString%%"${research}"*}
  [ ${#index} -eq ${#inString} ] && index=-1 || index=$((${#index}))

  echo "$index" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}