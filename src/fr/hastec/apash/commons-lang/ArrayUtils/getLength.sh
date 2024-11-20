#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

##/
# @name ArrayUtils.getLength
# @brief Returns the length of the specified array.
# @description
#   Take care that the length of an array does not correspond $#.
#   Indeed, $# return the number of element in an array.
#   It's possible like in bash to have discontinued indexes.
#   Array indexes should be less than APASH_ARRAY_LAST_INDEX (limit depending of the shell).
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
# @see [ArrayUtils.getNumberOfElements](./getNumberOfElements.md)
#/
ArrayUtils.getLength() {
  Log.in $LINENO "$@"
  local apash_inArrayName="${1:-}"
  local apash_lastIndex

  # Get the last index
  apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_inArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }  

  # Return if the last index is the maximum array index because the length should +1 (overflow)
  [[ $apash_lastIndex == $APASH_ARRAY_LAST_INDEX ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  echo "$((apash_lastIndex+1))"                     || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
