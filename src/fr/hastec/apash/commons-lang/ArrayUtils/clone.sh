#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.init

##/
# @name ArrayUtils.clone
# @brief Copy an array into another array using references.
# @description
#   Values and indexes are preserved.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName                             | Type          | in/out   | Default    | Description                          |
# |--------|-------------------------------------|---------------|----------|------------|--------------------------------------|
# | $1     | apash_ArrayUtils_clone_inArrayName  | ref(string[]) | in       |            | Name of the array to clone.          |
# | $2     | apash_ArrayUtils_clone_outArrayName | ref(string[]) | out      |            | Name of the array which will receive the clone.|
#
# ### Example
# ```bash
#    ArrayUtils.clone  ""       ""               # failure
#
#    myVar="dummy"
#    ArrayUtils.clone  "myVar"  "myClone"        # failure
#
#    declare -A myMap
#    ArrayUtils.clone  "myMap"  "myClone"        # failure
#
#    myArray=()
#    myClone=("a")
#    ArrayUtils.clone     "myArray"  "myClone"   # myClone=()
#    
#    myArray=("a" "b" "" "c")
#    myClone=("d" "e" "f")
#    ArrayUtils.clone     "myArray"  "myClone"   # myClone=("a" "b" "" "c")
#
#    myArray=("a" "b" "" "c")
#    myClone=()
#    ArrayUtils.clone     "myArray"  "myClone"   # myClone=("a" "b" "" "c")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When input arguments are arrays.
# @exitcode 1 Otherwise.
#/
ArrayUtils.clone() {
  Log.in $LINENO "$@"
  local apash_ArrayUtils_clone_inArrayName="${1:-}"
  local apash_ArrayUtils_clone_outArrayName="${2:-}"
  ArrayUtils.isArray "$apash_ArrayUtils_clone_inArrayName"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.init    "$apash_ArrayUtils_clone_outArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  local -n apash_ArrayUtils_clone_inArrayName="$apash_ArrayUtils_clone_inArrayName"
  local -n apash_ArrayUtils_clone_outArray="$apash_ArrayUtils_clone_outArrayName"
  local i

  # Can't use direct wrapping because need to preserve indexes
  # apash_ArrayUtils_clone_outArray=("${apash_ArrayUtils_clone_inArrayName[@]}")  
  for i in "${!apash_ArrayUtils_clone_inArrayName[@]}"; do
    # shellcheck disable=SC2034
    apash_ArrayUtils_clone_outArray[i]="${apash_ArrayUtils_clone_inArrayName[i]}"
  done

  Log.out $LINENO; return "$APASH_SUCCESS"
}
