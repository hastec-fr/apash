#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.MapUtils.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariable
apash.import fr.hastec.apash.commons-lang.BashUtils.isDeclared
apash.import fr.hastec.apash.commons-lang.BashUtils.declareArray

##/
# @name ArrayUtils.init
# @brief Defensive programming technique initialize a map.
# @description
#   The map is created if the variable is not declared.
#   If it was a map, then reinitialize it.
#   If it's an existing variable or an array, then fail (prevent overriding).
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
# | $1     | ioMapName      | ref(string{}) | in/out   |            | Name of the map to initialize.       |
#
# ### Example
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
#/
MapUtils.init() {
  Log.in $LINENO "$@"
  local apash_MapUtils_init_ioMapName="${1:-}"
  BashUtils.isVariableNameValid "$apash_MapUtils_init_ioMapName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  BashUtils.isVariable "$apash_MapUtils_init_ioMapName"          && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.isArray "$apash_MapUtils_init_ioMapName"            && { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # If the variable is not declared, then create the corresponding global value.
  if ! BashUtils.isDeclared "$apash_MapUtils_init_ioMapName"; then
    BashUtils.declareArray "$apash_MapUtils_init_ioMapName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  if [ "$APASH_SHELL" = "zsh" ]; then
    : ${(PAA)apash_MapUtils_init_ioMapName::=${(kv)${MaptUtils_EMPTY_MAP:-}}} && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  else
    local -n apash_ArrayUtils_init_outArray="$apash_MapUtils_init_ioMapName"
    apash_ArrayUtils_init_outArray=() && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  fi
  Log.out $LINENO; return "$APASH_FAILURE"
}
