#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.MapUtils.isMap
apash.import fr.hastec.apash.commons-lang.MapUtils.init

##/
# @name MapUtils.clone
# @brief Copy a map into another map using references.
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
# | $1     | inMapName      | ref(string{}) | in       |            | Name of the map to clone.            |
# | $2     | outMapName     | ref(string{}) | out      |            | Name of the map which will receive the clone.|
#
# ### Example
# ```bash
#    MapUtils.clone  ""       ""               # failure
#
#    myVar="dummy"
#    ArrayUtils.clone  "myVar"  "myClone"      # failure
#
#    declare -a myClone
#    MapUtils.clone  "myVar"  "myClone"        # failure
#
#    declare -A myMap=()
#    declare -A myClone=([foo]="bar")
#    MapUtils.clone     "myArray"  "myClone"   # myClone={}
#   
#    declare -A myArray=([foo]="bar" [apash_key]="val")
#    declare -A myClone=()
#    MapUtils.clone     "myArray"  "myClone"   # myClone=([foo]="bar" [apash_key]="val")
# 
#    declare -A myArray=([foo]="bar" [apash_key]="val")
#    declare -A myClone=([bat]="man")
#    MapUtils.clone     "myArray"  "myClone"   # myClone={ [foo]="bar" [apash_key]="val" }
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When input arguments are maps.
# @exitcode 1 Otherwise.
#/
MapUtils.clone() {
  Log.in $LINENO "$@"
  local apash_MapUtils_clone_inMapName="$1"
  local apash_MapUtils_clone_outMapName="$2"
  MapUtils.isMap   "$apash_MapUtils_clone_inMapName"  || { Log.out $LINENO; return "$APASH_FAILURE"; }
  MapUtils.init    "$apash_MapUtils_clone_outMapName" || { Log.out $LINENO; return "$APASH_FAILURE"; }

  if [ "$APASH_SHELL" = "zsh" ]; then
    : ${(PAA)apash_MapUtils_clone_outMapName::="${(AAkv@)${(P)1}}"} && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  else
    local -n ref_MapUtils_clone_inMap="$apash_MapUtils_clone_inMapName"
    local -n ref_MapUtils_clone_outMap="$apash_MapUtils_clone_outMapName"
    local apash_key

    for apash_key in "${!ref_MapUtils_clone_inMap[@]}"; do
      # shellcheck disable=SC2034
      ref_MapUtils_clone_outMap["$apash_key"]="${ref_MapUtils_clone_inMap["$apash_key"]}"
    done
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi
  Log.out $LINENO; return "$APASH_FAILURE"
}
