#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.sh
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid
apash.import fr.hastec.apash.commons-lang.BashUtils.isVariable
apash.import fr.hastec.apash.commons-lang.BashUtils.isDeclared
apash.import fr.hastec.apash.commons-lang.MapUtils.isMap
apash.import fr.hastec.apash.commons-lang.BashUtils.declareArray

##/
# @name ArrayUtils.init
# @brief Defensive programming technique initialize an array.
# @description
#   The array is created if the variable is not declared.
#   If it was an array, then reinitialize it.
#   If it's an existing variable or map, just fail to protect overriding.
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
# | $1     | ref_ArrayUtils_init_ioArrayName    | ref(string[]) | in       |            | Name of the array to initialize.     |
#
# #### Example
# ```bash
#    ArrayUtils.init  "myArray"         # myArray=()
#
#    myArray=()
#    ArrayUtils.init  "myArray"         # myArray=()
#
#    myArray=("a" "b" "c")
#    ArrayUtils.init  "myArray"         # myArray=()
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the array is created.
# @exitcode 1 Otherwise.
#
# @see [nullToEmpty](./nullToEmpty.md), [anythingToEmpty](./anythingToEmpty.md)
#/
ArrayUtils.init() {
  Log.entry "$LINENO" "$@"
  local ref_ArrayUtils_init_ioArrayName="$1"
  BashUtils.isVariableNameValid "$ref_ArrayUtils_init_ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  BashUtils.isVariable "$ref_ArrayUtils_init_ioArrayName" && return "$APASH_FUNCTION_FAILURE"
  MapUtils.isMap "$ref_ArrayUtils_init_ioArrayName" && return "$APASH_FUNCTION_FAILURE"

  # If the variable is not declared, then create the corresponding global value.
  if ! BashUtils.isDeclared "$ref_ArrayUtils_init_ioArrayName"; then
    BashUtils.declareArray "$ref_ArrayUtils_init_ioArrayName" && return "$APASH_FUNCTION_SUCCESS"
    return "$APASH_FUNCTION_FAILURE"
  fi

  # Only way found in zsh to reset an existing array and preserving its original scope
  # P: pointer, A: consider the pointed value as array and provide an existing empty array.
  if [ "$APASH_SHELL" = "zsh" ]; then
    : ${(PA)ref_ArrayUtils_init_ioArrayName::=${ArrayUtils_EMPTY_ARRAY[@]}} && return "$APASH_FUNCTION_SUCCESS"
  else
    local -n ref_ArrayUtils_init_outArray="$ref_ArrayUtils_init_ioArrayName"
    ref_ArrayUtils_init_outArray=() && return "$APASH_FUNCTION_SUCCESS"
  fi
  return "$APASH_FUNCTION_FAILURE"
}
