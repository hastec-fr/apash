#!/usr/bin/env bash

# File description ###########################################################
# @name StringUtils.substring
# @brief Gets a substring from the specified String.
# @description
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# Gets a substring from the specified String. The first character correspond
# to the index 0. Negative index are possible, in this case, it counts from the end.
# Any index minus 0 will be considered as 0 and any index over the length of the string
# will be considered as the length of the string.
# @example
#    StringUtils.substring ""              # return ""
#    StringUtils.substring "abc"  0   2    # return "ab"
#    StringUtils.substring "abc" -2  -1    # return "b"
#    StringUtils.substring "abc" -4   2    # return "ab"
#    StringUtils.substring "abc"  2   6    # return "c"
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