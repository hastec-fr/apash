#!/usr/bin/env bash

# Dependencies #################################################################
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
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | apash_inMapName      | ref(string{}) | in       |            | Name of the hashmap to check.         |
# | $2     | apash_inKey          | string        | in       |            | Key to check.                         |
#
# ### Example
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
   Log.in $LINENO "$@"
   local apash_inMapName="${1:-}"
   local apash_inKey="${2:-}"
   local apash_k

   MapUtils.isMap "$apash_inMapName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

   if [ "$APASH_SHELL" = "zsh" ]; then
      for apash_k in "${(@kP)apash_inMapName}"; do
         [[ "$apash_k" == "$apash_inKey" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
      done
   else
      local -n inMap="$apash_inMapName"
      for apash_k in "${!inMap[@]}"; do
         [[ "$apash_k" == "$apash_inKey" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
      done
   fi
   Log.out $LINENO; return "$APASH_FAILURE"
}
