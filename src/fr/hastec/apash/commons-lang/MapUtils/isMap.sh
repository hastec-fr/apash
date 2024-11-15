#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log

##/
# @name MapUtils.isMap
# @brief Check if the input name is an map or not.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inDate         | string        | in       |            | Name of the hashmap to check.         |
#
# #### Example
# ```bash
#    MapUtils.isMap  ""                # false
#    MapUtils.isMap  "myVar"           # false
#
#    declare -a myArray
#    MapUtils.isMap  "myArray"         # false
#   
#    myArray=()
#    MapUtils.isMap  "myArray"         # false
#
#    declare -A myMap
#    MapUtils.isMap   "myMap"          # true
#
#    declare -A myMap=(["foo"]="bar" ["key"]="value")
#    MapUtils.containsKey   "myMap"    # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the corresponding variable is a hashmap.
# @exitcode 1 Otherwise.
#/
MapUtils.isMap() {
   Log.entry "$LINENO" "$@"
   declare -p "$1" 2> /dev/null | grep -q "^\(declare\|typeset\).* -A " && return "$APASH_FUNCTION_SUCCESS"
   return "$APASH_FUNCTION_FAILURE"
}
