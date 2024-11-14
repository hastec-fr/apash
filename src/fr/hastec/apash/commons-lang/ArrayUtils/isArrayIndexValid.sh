#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.NumberUtils.isDigits
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

##/
# @name ArrayUtils.isArrayIndexValid
# @brief Returns whether a given array can safely be accessed at the given index.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ### Authors:
# * Benjamin VARGIN
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inArrayName    | ref(string[]) | in       |            | The array to inspect                 |
# | $2     | inIndex        | number        | in       |            | The index of the array to be inspected.  |
#
# #### Example
# ```bash
#    myArray=("a" "b" "" "c" "b")
#    ArrayUtils.isArrayIndexValid "myArray" "1"                  # true
#    ArrayUtils.isArrayIndexValid "myArray" "${#myArray}"        # false
#    ArrayUtils.isArrayIndexValid "myArray" "$((${#myArray}-1))" # true
#    ArrayUtils.isArrayIndexValid "myArray" "-1"                 # false
#    ArrayUtils.isArrayIndexValid "myArray" "5"                  # false
#    ArrayUtils.isArrayIndexValid "myArray"                      # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 Whether the given index is safely-accessible in the given array.
# @exitcode 1 Otherwise.
#/
ArrayUtils.isArrayIndexValid() {
  Log.entry "$LINENO" "$@"
  local inArrayName="$1"
  local inIndex="$2"
  local lastIndex
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isDigits "$inIndex"   || return "$APASH_FUNCTION_FAILURE"
  lastIndex=$(ArrayUtils.getLastIndex "$inArrayName")  || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isDigits "$lastIndex" || return "$APASH_FUNCTION_FAILURE"

  [[ $inIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && return "$APASH_FUNCTION_FAILURE"
  [[ $inIndex -gt $lastIndex ]] && return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}
