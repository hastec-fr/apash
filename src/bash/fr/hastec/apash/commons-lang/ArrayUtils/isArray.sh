#!/usr/bin/env bash

# File description ###########################################################
# @name ArrayUtils.isArray
# @brief Check if the input name is an array or not.
# @description
#
# ### Since:
# 0.1.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description*
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inVarName      | string        | in       |            | Name of the array.                   |
# 
# #### Example
# ```bash
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
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 Whe the corresponding variable is an array.
# @exitcode 1 Otherwise.
ArrayUtils.isArray() {
   local inVarName="$1"
   declare -p "$inVarName" 2> /dev/null | grep -q 'declare -a' && return "$APASH_FUNCTION_SUCCESS"
   return "$APASH_FUNCTION_FAILURE"
}