#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MapUtils.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariable
apash.import fr.hastec.apash.commons-lang.BashUtils.isDeclared
apash.import fr.hastec.apash.commons-lang.BashUtils.declareArray

# File description ###########################################################
# @name ArrayUtils.init
# @brief Defensive programming technique initialize a map.
# @description
#   The map is created if the variable is not declared.
#   If it was a map, then reinitialize it.
#   If it's an existing variable or an array, just fail to protect overriding.
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
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | ioMapName      | ref(string{}) | in/out   |            | Name of the map to initialize.       |
#
# @description
# #### Example
# ```bash
#    
#    myVar="test" 
#    MapUtils.init  "myVar"         # failure
#
#    myArray=("a" "b" "c")
#    MapUtils.init  "myArray"       # failure
#
#
#    MapUtils.init  "myMap"         # myMap={}
#
#    declare -A myMap=()
#    MapUtils.init  "myMap"         # myMap={}
#
#    declare -A myMap=([foo]=bar)
#    MapUtils.init  "myMap"         # myMap={ [foo]=bar }

# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the map is created.
# @exitcode 1 Otherwise.
MapUtils.init() {
  local ref_MapUtils_init_ioMapName="$1"
  BashUtils.isVariableNameValid "$ref_MapUtils_init_ioMapName" || return "$APASH_FUNCTION_FAILURE"
  BashUtils.isVariable "$ref_MapUtils_init_ioMapName" && return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$ref_MapUtils_init_ioMapName" && return "$APASH_FUNCTION_FAILURE"

  # If the variable is not declared, then create the corresponding global value.
  if ! BashUtils.isDeclared "$ref_MapUtils_init_ioMapName"; then
    BashUtils.declareArray "$ref_MapUtils_init_ioMapName" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  if [ "$APASH_SHELL" = "zsh" ]; then
    : ${(PAA)ref_MapUtils_init_ioMapName::=${(kv)MaptUtils_EMPTY_MAP}} && return "$APASH_FUNCTION_SUCCESS"
  else
    local -n ref_ArrayUtils_init_outArray="$ref_MapUtils_init_ioMapName"
    ref_ArrayUtils_init_outArray=() && return "$APASH_FUNCTION_SUCCESS"
  fi
  return "$APASH_FUNCTION_FAILURE"
}
