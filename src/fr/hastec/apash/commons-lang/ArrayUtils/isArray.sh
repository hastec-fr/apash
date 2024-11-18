#!/usr/bin/env bash

apash.import fr.hastec.apash.util.Log

##/
# @name ArrayUtils.isArray
# @brief Check if the input name is an array or not.
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
# | $1     | inVarName      | string        | in       |            | Name of the array.                   |
# 
# ### Example
# ```bash
#    ArrayUtils.isArray  ""          # false
#    ArrayUtils.isArray  "myVar"     # false
#
#    declare -a myArray
#    ArrayUtils.isArray  "myArray"   # true
#   
#    myArray=()
#    ArrayUtils.isArray  "myArray"   # true
#
#    declare -A myMap
#    ArrayUtils.isArray   "myMap"    # false
#
#    myMap=(["foo"]="bar")
#    ArrayUtils.isArray   "myMap"    # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 Whe the corresponding variable is an array.
# @exitcode 1 Otherwise.
#/
ArrayUtils.isArray() {
   Log.in $LINENO "$@"
   local inVarName="$1"
   declare -p "$inVarName" 2> /dev/null | grep -q "^\(declare\|typeset\).* -a " && { Log.out $LINENO; return "$APASH_SUCCESS"; }
   Log.out $LINENO; return "$APASH_FAILURE"
}
