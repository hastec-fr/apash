#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.MapUtils.isMap

##/
# @name MapUtils.containsKey
# @brief Check if the input value is present in the input map.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
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
#
MapUtils.containsKey() {
   Log.entry "$LINENO" "$@"
   local inMapName="$1"
   local inKey="$2"
   local k

   MapUtils.isMap "$inMapName" || return "$APASH_FUNCTION_FAILURE"

   if [ "$APASH_SHELL" = "zsh" ]; then
      for k in "${(@kP)inMapName}"; do
         [[ "$k" == "$inKey" ]] && return "$APASH_FUNCTION_SUCCESS"
      done
   else
      local -n inMap="$inMapName"
      for k in "${!inMap[@]}"; do
         [[ "$k" == "$inKey" ]] && return "$APASH_FUNCTION_SUCCESS"
      done
   fi
   return "$APASH_FUNCTION_FAILURE"
}
