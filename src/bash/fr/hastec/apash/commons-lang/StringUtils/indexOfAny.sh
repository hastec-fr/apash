#!/usr/bin/env bash

import fr.hastec.apash.commons-lang.StringUtils.indexOf

# @description Search a string to find the first index 
#              of any string in the given set of string.
# @example
#
# @arg $1 string Input string to check
# @arg $2 array  The list of string to research
#
# @stdout The first minimum of index the matching research, -1 if no match
#         or empty string input or empty research
# @stderr None
#
# @exitcode 0 If the index can be displayed
# @exitcode 1 Otherwise
# see https://stackoverflow.com/questions/10953833/passing-multiple-distinct-arrays-to-a-shell-function
StringUtils.indexOfAny() {
  local inString="$1"
  local -n research="$2" 2> /dev/null || local research=()
  local index=-1
  local i

  if [[ ${#research[@]} -eq 0 ]]; then
    echo "$index" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  for r in "${research[@]}"; do
    i=$(StringUtils.indexOf "$inString" "$r")
    [[ $i -ge 0  && ($index -eq -1 || $i -lt $index) ]] && index=$i
  done

  echo "$index" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}