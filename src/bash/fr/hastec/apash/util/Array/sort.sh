#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

# File description ###########################################################
# @name Array.sort
# @brief Sorts the specified array into ascending natural order.
#
# @description
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [util](../../util.md) / [Array](../Array.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Example
# ```bash
#    myArray=("a" "b" "c")
#    Array.sort "myArray"  # ("a" "b" "c")
#
#    myArray=("a" "c" "b")
#    Array.sort "myArray"  # ("a" "b" "c")
#
#    myArray=("beta-20" "beta-10" "beta-1")
#    Array.sort "myArray"  # ("beta-1" "beta-10" "beta-20")
#
#    myArray=("1" "a" "2" "3")
#    Array.sort "myArray"  # ("1" "2" "3" "a")
#   
#    myArray=("1" "")
#    Array.sort "myArray"  # ("" "1")
# ```
#
# @arg $1 ref(string[]) The array to sort.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 True Whether the array is sorted according to natural ordering.
# @exitcode 1 Otherwise.
Array.sort() {
  local inArrayRef="$1"
  local -n inArray="$inArrayRef" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$inArrayRef" || return "$APASH_FUNCTION_FAILURE"

  [[ ${#inArray[@]} -eq 0 ]] && return "$APASH_FUNCTION_SUCCESS"
  readarray -d '' inArray < <(printf "%s\0" "${inArray[@]}" | sort -z) &&  return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_SUCCESS"
}