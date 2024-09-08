#!/usr/bin/env bash

# Dependencies #####################################
import fr.hastec.apash.commons-lang.StringUtils.indexOf

# @name StringUtils.indexOfAny
# @brief  Search a string to find the first index of any character in the given set of characters.
# @example
#                        StringUtils.indexOfAny ""                 # -1
#    arr=("")          ; StringUtils.indexOfAny ""           arr   #  0
#    arr=("a")         ; StringUtils.indexOfAny ""           arr   # -1
#    arr=("cd" "ab" )  ; StringUtils.indexOfAny "zzabyycdxx" arr   #  2
#    arr=("zab" "aby") ; StringUtils.indexOfAny "zzabyycdxx" arr   #  1
#
# @arg $1 string The string to check.
#
# @stdout The first minimum index matching researches, -1 if no match
#         or empty input string or empty research.
# @stderr None.
#
# @see [indexOf](indexOf.md)
# @see [StringUtils](../StringUtils.md)
#
# @exitcode 0 If the index can be displayed.
# @exitcode 1 Otherwise.
#
# Note for passing array by reference
# see https://stackoverflow.com/questions/10953833/passing-multiple-distinct-arrays-to-a-shell-function
StringUtils.indexOfAny() {
  local inString="$1"
  local -n research="$2" 2> /dev/null || local research=()
  local index=-1
  local i

  # If the researsh is empty then return -1.
  if [[ ${#research[@]} -eq 0 ]]; then
    echo "$index" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  # For each reseach, apply the index of function
  # and keep the minimum index if string has been found.
  for r in "${research[@]}"; do
    i=$(StringUtils.indexOf "$inString" "$r")
    [[ $i -ge 0  && ($index -eq -1 || $i -lt $index) ]] && index=$i
  done

  echo "$index" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}