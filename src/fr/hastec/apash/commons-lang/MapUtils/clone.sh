#!/usr/bin/env bash

# Dependencies #####################################
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
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inMapName      | ref(string{}) | in       |            | Name of the map to clone.            |
# | $2     | outMapName     | ref(string{}) | out      |            | Name of the map which will receive the clone.|
#
# #### Example
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
#    declare -A myArray=([foo]="bar" [key]="val")
#    declare -A myClone=()
#    MapUtils.clone     "myArray"  "myClone"   # myClone=([foo]="bar" [key]="val")
# 
#    declare -A myArray=([foo]="bar" [key]="val")
#    declare -A myClone=([bat]="man")
#    MapUtils.clone     "myArray"  "myClone"   # myClone={ [foo]="bar" [key]="val" }
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When input arguments are maps.
# @exitcode 1 Otherwise.
#/
MapUtils.clone() {
  Log.entry "$LINENO" "$@"
  local ref_MapUtils_clone_inMapName="$1"
  local ref_MapUtils_clone_outMapName="$2"
  MapUtils.isMap   "$ref_MapUtils_clone_inMapName"  || return "$APASH_FUNCTION_FAILURE"
  MapUtils.init    "$ref_MapUtils_clone_outMapName" || return "$APASH_FUNCTION_FAILURE"

  if [ "$APASH_SHELL" = "zsh" ]; then
    : ${(PAA)ref_MapUtils_clone_outMapName::="${(AAkv@)${(P)1}}"} && return "$APASH_FUNCTION_SUCCESS"
  else
    local -n ref_MapUtils_clone_inMap="$ref_MapUtils_clone_inMapName"   2> /dev/null || return "$APASH_FUNCTION_FAILURE"
    local -n ref_MapUtils_clone_outMap="$ref_MapUtils_clone_outMapName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
    local key

    for key in "${!ref_MapUtils_clone_inMap[@]}"; do
      # shellcheck disable=SC2034
      ref_MapUtils_clone_outMap["$key"]="${ref_MapUtils_clone_inMap["$key"]}"
    done
    return "$APASH_FUNCTION_SUCCESS"
  fi
  return "$APASH_FUNCTION_FAILURE"
}
