#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MapUtils.isMap
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

# File description ###########################################################
# @name MapUtils.getKeys
# @brief Return an array containing all keys of a map.
# @description
#
# ### Since:
# 0.2.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MapUtils](../MapUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | outArrayName   | ref(string[]) | out      |            | Name of the array containing keys.    |
# | $2     | inMapName      | ref(string{}) | in       |            | Name of the hashmap to check.         |
#
# #### Example
# ```bash
#    declare -A myMap=(["foo"]="bar" ["key"]="value")
#    MapUtils.getKeys  "myArray" "myMap"          # myArray=(foo bar)
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When output array is filled up with the keys.
# @exitcode 1 Otherwise.
MapUtils.getKeys() {
   local outArrayName="$1"
   local inMapName="$2"
   local outArray=()
   
   MapUtils.isMap "$inMapName" || return "$APASH_FUNCTION_FAILURE"

   if [ "$APASH_SHELL" = "zsh" ]; then
      outArray=("${(@kP)inMapName}")
   else # bash
      local -n inMap="$inMapName"
      outArray=("${!inMap[@]}")
   fi
   ArrayUtils.clone "outArray" "$outArrayName" && return "$APASH_FUNCTION_SUCCESS"
   return "$APASH_FUNCTION_FAILURE"
}
