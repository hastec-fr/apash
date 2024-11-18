#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.BashUtils.isDeclared
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.MapUtils.isMap

##/
# @name BashUtils.isVariable
# @brief Defensive programming technique to check that a variable exists.
# @description
#   Arrays and Maps are not considered as variables.
#   If you need to consider arrays and maps then use BashUtils.isDeclared.
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
# | $1     | varName        | string        | in       |            | Variable name to check.               |
#
# ### Example
# ```bash
#    BashUtils.isVariable  ""              # false
#    BashUtils.isVariable  "myVar"         # false
#
#    myVar=myValue
#    BashUtils.isVariable  "myVar"         # true
#
#    declare -a myArray=()
#    BashUtils.isVariable  "myArray"       # false
#
#    declare -A myMap=([foo]=bar)
#    BashUtils.isVariable  "myMap"         # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input name corresponds to a variable (not including arrays and maps).
# @exitcode 1 Otherwise.
#/
BashUtils.isVariable() {
  Log.in $LINENO "$@"
  local varName="$1"
  BashUtils.isDeclared "$varName" || { Log.out $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.isArray   "$varName" && { Log.out $LINENO; return "$APASH_FAILURE"; }
  MapUtils.isMap       "$varName" && { Log.out $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
