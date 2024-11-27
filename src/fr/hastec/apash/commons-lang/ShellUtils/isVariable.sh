#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ShellUtils.isDeclared
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.MapUtils.isMap

##/
# @name ShellUtils.isVariable
# @brief Defensive programming technique to check that a variable exists.
# @description
#   Arrays and Maps are not considered as variables.
#   If you need to consider arrays and maps then use ShellUtils.isDeclared.
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
#    ShellUtils.isVariable  ""              # false
#    ShellUtils.isVariable  "myVar"         # false
#
#    myVar=myValue
#    ShellUtils.isVariable  "myVar"         # true
#
#    declare -a myArray=()
#    ShellUtils.isVariable  "myArray"       # false
#
#    declare -A myMap=([foo]=bar)
#    ShellUtils.isVariable  "myMap"         # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the input name corresponds to a variable (not including arrays and maps).
# @exitcode 1 Otherwise.
#/
ShellUtils.isVariable() {
  Log.in $LINENO "$@"
  local varName="${1:-}"
  ShellUtils.isDeclared "$varName" || { Log.out $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.isArray   "$varName" && { Log.out $LINENO; return "$APASH_FAILURE"; }
  MapUtils.isMap       "$varName" && { Log.out $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
