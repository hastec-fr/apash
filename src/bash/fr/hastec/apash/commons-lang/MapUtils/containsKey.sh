#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MapUtils.isMap

# File description ###########################################################
# @name MapUtils.containsKey
# @brief Check if the input value is present in the input map.
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
# | $1     | inMapName      | ref(string{}) | in       |            | Name of the hashmap to check.         |
# | $2     | inKey          | string        | in       |            | Key to check.                         |
#
# #### Example
# ```bash
#    declare -A myMap=(["foo"]="bar" ["key"]="value")
#    MapUtils.containsKey   "myMap"          # false
#    MapUtils.containsKey   "myMap" "foo"    # true
#    MapUtils.containsKey   "myMap" "wrong"  # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input key is present in the hashmap.
# @exitcode 1 Otherwise.
MapUtils.containsKey() {
   local inMapName="$1"
   local inKey="$2"

   MapUtils.isMap "$inMapName" || return "$APASH_FUNCTION_FAILURE"
   local -n inMap="$inMapName"

   [[ -v inMap["$inKey"] ]] && return "$APASH_FUNCTION_SUCCESS"
   return "$APASH_FUNCTION_FAILURE"
}
