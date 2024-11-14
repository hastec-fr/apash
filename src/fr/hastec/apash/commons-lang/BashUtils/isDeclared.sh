#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log

##/
# @name BashUtils.isDeclared
# @brief Defensive programming technique to check that a variable is declared.
# @description
#   Arrays and Maps are considered as declared too.
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
# | $1     | varName        | string        | in       |            | Variable name to check.               |
#
# #### Example
# ```bash
#    BashUtils.isDeclared  ""              # false
#    BashUtils.isDeclared  "myVar"         # false
#
#    myVar=myValue
#    BashUtils.isDeclared  "myVar"         # true
#
#    declare -a myArray=()
#    BashUtils.isDeclared  "myArray"       # true
#
#    declare -A myMap=([foo]=bar)
#    BashUtils.isDeclared  "myMap"         # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the variable is declared (even an array or a map).
# @exitcode 1 Otherwise.
#
# @see
# - [BashUtils.isDeclared](./isDeclared.md), 
# - [ArrayUtils.isArray](../ArrayUtils/isArray.md),
# - [MapUtils.isMap](../MapUtils/isMap.md)
#/
BashUtils.isDeclared() {
  Log.entry "$LINENO" "$@"
  local varName="$1"
  declare -p "$varName" > /dev/null 2>&1 && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
