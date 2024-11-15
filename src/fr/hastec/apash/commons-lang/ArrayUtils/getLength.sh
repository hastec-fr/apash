#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

##/
# @name ArrayUtils.getLength
# @brief Returns the length of the specified array.
# @description
#   Take care that the length of an array does not correspond to its last index.
#   Array indexes are set to Long_MAX_VALUE (9223372036854775807).
#   Setting this value does not mean that the length is 9223372036854775807.
#   If you need the last index, prefer the usage of ArrayUtils.getLastIndex.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to get length.     |
#
# ### Example
# ```bash
#    myArray=("a" "b" "" "c")
#    ArrayUtils.getLength  "myArray"      # 4
#
#    myArray[9223372036854775807]=z
#    ArrayUtils.getLength  "myArray"      # 5 ([0]="a" [1]="b" [2]="" [3]="c" [9223372036854775807]="z")
#
#    myArray=()
#    ArrayUtils.getLength  "myArray"      # 0
# ```
#
# @stdout The length of the array, or empty if it's not an array or does not exists.
# @stderr None.
#
# @exitcode 0 When input array reference exists.
# @exitcode 1 Otherwise.
#
# @see [ArrayUtils.getLastIndex](./getLastIndex.md)
#/
ArrayUtils.getLength() {
  Log.entry "$LINENO" "$@"
  local inArrayName="$1"
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"

  if [ "$APASH_SHELL" = "zsh" ]; then
    echo "${#${(PA)inArrayName}[@]}" && return "$APASH_FUNCTION_SUCCESS"
  else # bash
    local lastIndex
    lastIndex="$(ArrayUtils.getLastIndex "$inArrayName")" || return "$APASH_FUNCTION_FAILURE"
    [[ $lastIndex == $APASH_ARRAY_LAST_INDEX ]] && return "$APASH_FUNCTION_FAILURE"
    echo "$((lastIndex+1))" && return "$APASH_FUNCTION_SUCCESS"
  fi

  return "$APASH_FUNCTION_FAILURE"
}
