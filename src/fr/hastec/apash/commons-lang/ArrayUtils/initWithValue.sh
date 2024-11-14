#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong

##/
# @name ArrayUtils.initWithValue
# @brief Initialize an array for a specific width and value
# @description
#   The array is created if the variable is not declared.
#   If it was an array, then reinitialize it.
#   If it's an existing variable or map, just fail to protect overriding.
#
# ## History
# @since 0.2.0 (hastec-fr)
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
# | $1     | ioArrayName    | ref(string[]) | in       |            | Name of the array to initialize.     |
# | $2     | inWidth        | number        | in       | 0          | Number of array record to initialize.|
# | $3     | inValue        | string        | in       | ""         | Value to initialize with.            |
#
# #### Example
# ```bash
#    ArrayUtils.initWithValue  "myArray" 3       # myArray=("" "" "")
#
#    myArray=()
#    ArrayUtils.initWithValue  "myArray" 4 0     # myArray=(0 0 0 0)
#
#    myArray=("a" "b" "c")
#    ArrayUtils.initWithValue  "myArray" 2 "ah!" # myArray=("ah!" "ah!")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is initialized.
# @exitcode 1 Otherwise.
#
# @see [nullToEmpty](./nullToEmpty.md), [anythingToEmpty](./anythingToEmpty.md)
#/
ArrayUtils.initWithValue() {
  Log.entry "$LINENO" "$@"
  local ioArrayName="$1"
  local inWidth="${2:-0}"
  local inValue="$3"
  local -i i
  local ref_ArrayUtils_initWithValue_outArray=()

  NumberUtils.isLong "$inWidth" || return "$APASH_FUNCTION_FAILURE"

  for ((i=0 ; i < inWidth; i++)); do
    ref_ArrayUtils_initWithValue_outArray+=("$inValue")
  done

  ArrayUtils.clone "ref_ArrayUtils_initWithValue_outArray" "$ioArrayName" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
