#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.MapUtils.isMap
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name MapUtils.getKeys
# @brief Return an array containing all keys of a map.
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
# | $1     | apash_outArrayName   | ref(string[]) | out      |            | Name of the array containing keys.    |
# | $2     | apash_inMapName      | ref(string{}) | in       |            | Name of the hashmap to check.         |
#
# ### Example
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
#/
MapUtils.getKeys() {
   Log.in $LINENO "$@"
   local apash_outArrayName="${1:-}"
   local apash_inMapName="${2:-}"
   local -a apash_outArray=()
   
   MapUtils.isMap "$apash_inMapName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

   if [ "$APASH_SHELL" = "zsh" ]; then
      apash_outArray=("${(@kP)apash_inMapName}")
   else # bash
      local -n inMap="$apash_inMapName"
      apash_outArray=("${!inMap[@]}")
   fi
   ArrayUtils.clone "apash_outArray" "$apash_outArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
   Log.out $LINENO; return "$APASH_SUCCESS"
}
