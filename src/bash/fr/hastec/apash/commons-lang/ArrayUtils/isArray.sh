#!/usr/bin/env bash

# File description ###########################################################
# @name ArrayUtils.isArray
# @brief Check if the input name is an array or not.
#
# @description
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [lang](../../lang.md) / [Math](../Math.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
#    ArrayUtils.isArray  ""          # false
#    ArrayUtils.isArray  "myVar"     # false
#
#    declare -a myArray
#    ArrayUtils.isArray  "myArray"   # true
#   
#    myArray=()
#    ArrayUtils.isArray  "myArray"   # true
#
#    declare -A myMap
#    ArrayUtils.isArray   "myMap"    # false
#
#    myMap=(["foo"]="bar")
#    ArrayUtils.isArray   "myMap"    # false
#
# @arg $1 string Name of the array.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 Whe the corresponding variable is an array.
# @exitcode 1 Otherwise.
ArrayUtils.isArray() {
   declare -p "$1" 2> /dev/null | grep -q 'declare -a' && return "$APASH_FUNCTION_SUCCESS"
   return "$APASH_FUNCTION_FAILURE"
}