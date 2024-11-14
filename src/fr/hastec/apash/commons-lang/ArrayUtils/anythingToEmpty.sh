#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid
apash.import fr.hastec.apash.commons-lang.BashUtils.declareArray

##/
# @name ArrayUtils.anythingToEmpty
# @brief Create an array even if the variable named was already declared.
# @description
#   The reference is transformed in any case in an empty array (even if it's a map or a variable).
#   Existing arrays are reinitialized.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | in & out |            | Name of the array to create.         |
#
# #### Example
# ```bash
#    ArrayUtils.anythingToEmpty  "myArray"         # myArray=()
#
#    myArray=()
#    ArrayUtils.anythingToEmpty  "myArray"         # myArray=()
#
#    myArray=("a" "b" "c")
#    ArrayUtils.anythingToEmpty  "myArray"         # myArray=()
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 When the variable name is not valid.
#
# @see 
#  * [nullToEmpty](./nullToEmpty.md): Create array if not a variable or a map.
#  * [init](./init.md): Initiliaze only if the input is an array.
#/
ArrayUtils.anythingToEmpty() {
  Log.entry "$LINENO" "$@"
  local ioArrayName="$1"
  BashUtils.isVariableNameValid "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  unset "$ioArrayName"
  BashUtils.declareArray "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  return "$APASH_FUNCTION_SUCCESS"
}
