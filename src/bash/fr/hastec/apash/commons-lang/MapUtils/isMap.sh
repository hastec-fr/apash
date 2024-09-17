#!/usr/bin/env bash

# File description ###########################################################
# @name MapUtils.isMap
# @brief Check if the input name is an map or not.
#
# @description
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MapUtils](../MapUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
#    MapUtils.isMap  ""          # false
#    MapUtils.isMap  "myVar"     # false
#
#    declare -a myArray
#    MapUtils.isMap  "myArray"   # false
#   
#    myArray=()
#    MapUtils.isMap  "myArray"   # false
#
#    declare -A myMap
#    MapUtils.isMap   "myMap"    # true
#
#    myMap={}
#    MapUtils.isMap   "myMap"    # true
#
#
# @arg $1 string Name of the hashmap.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the corresponding variable is a hashmap.
# @exitcode 1 Otherwise.
MapUtils.isMap() {
   declare -p "$1" 2> /dev/null | grep -q 'declare -A' && return "$APASH_FUNCTION_SUCCESS"
   return "$APASH_FUNCTION_FAILURE"
}