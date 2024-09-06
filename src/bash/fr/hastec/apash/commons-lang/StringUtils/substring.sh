#!/usr/bin/env bash

# @description Gets a substring from the specified String.
# @example
#    StringUtils.trim ""                 # return ""
#    StringUtils.trim "     "            # return ""
#    StringUtils.trim "  Hello  World  " # return "Hello  World"
#
# @arg $1 the String to get the substring from
# @arg $2 the position to start from, negative means count back from the end of the String by this many characters
# @arg $3 the position to end at (exclusive), negative means count back from the end of the String by this many characters
#
# @stdout substring from start position to end position, empty if empty String input
# @stderr None
#
# @exitcode 0 If the string can be displayed.
# @exitcode 1 Otherwise.
StringUtils.substring() {
  local inString="$1"
  local start=${2:-0}
  local end=${3:-${#inString}}

  # Consider negative position relative to the end of the input string
  [[ $start -lt 0 ]] && start=$((${#inString}+start))
  [[ $end -lt 0 ]]   && end=$((${#inString}+end))

  # If still negative, then consider to 0
  [[ $start -lt 0 ]] && start=0
  [[ $end -lt 0 ]] && end=0

  # If greater than the number of char in the string then get the length
  [[ $start -gt ${#inString} ]] && start=${#inString}
  [[ $end -gt ${#inString} ]] && end=${#inString}

  # If same index, or start greater than end, then return empty
  if [[ $start -ge $end ]]; then
    echo "" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  local substring=${inString:$start:$((end - start))}

  echo "$substring" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}