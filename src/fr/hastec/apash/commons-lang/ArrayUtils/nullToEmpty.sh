#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid
apash.import fr.hastec.apash.commons-lang.BashUtils.isDeclared
apash.import fr.hastec.apash.commons-lang.BashUtils.declareArray

##/
# @name ArrayUtils.nullToEmpty
# @brief Defensive programming technique to change a null reference to an empty Array
#
# @description
#   Only non referred variables are automatically transformed to emptyArray.
#   If array already exists, then nothing is done.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array if exists.        |
#
# ### Example
# ```bash
#    ArrayUtils.nullToEmpty  ""                # failure
#
#    myVar=test
#    ArrayUtils.nullToEmpty  "myVar"           # failure
#
#    declare -A myMap
#    ArrayUtils.nullToEmpty  "myMap"           # failure
#
#    ArrayUtils.nullToEmpty  "myUndefVar"      # myUndefVar=()
#
#    myArray=()
#    ArrayUtils.nullToEmpty  "myArray"         # myArray=()
#
#    myArray=("a" "b" "c")
#    ArrayUtils.nullToEmpty  "myArray"  "a"    # myArray=("a" "b" "c")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
#/
ArrayUtils.nullToEmpty() {
  Log.in $LINENO "$@"
  local inArrayName="${1:-}"
  BashUtils.isVariableNameValid "$inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.isArray "$inArrayName" && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  # Fails if the variable is declared and not an array
  BashUtils.isDeclared "$inArrayName" && { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # Declare the array with dynamic name
  BashUtils.declareArray "$inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  Log.out $LINENO; return "$APASH_SUCCESS"
}
