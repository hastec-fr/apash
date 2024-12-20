#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.sh
apash.import fr.hastec.apash.commons-lang.ShellUtils.isVariableNameValid
apash.import fr.hastec.apash.commons-lang.ShellUtils.isVariable
apash.import fr.hastec.apash.commons-lang.ShellUtils.isDeclared
apash.import fr.hastec.apash.commons-lang.MapUtils.isMap
apash.import fr.hastec.apash.commons-lang.ShellUtils.declareArray

##/
# @name ArrayUtils.init
# @brief Defensive programming technique to initialize an array.
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
# ### Arguments
# | #      | varName                              | Type          | in/out   | Default    | Description                          |
# |--------|--------------------------------------|---------------|----------|------------|--------------------------------------|
# | $1     | apash_ArrayUtils_init_ioArrayName    | ref(string[]) | in       |            | Name of the array to initialize.     |
#
# ### Example
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
  Log.in $LINENO "$@"
  local apash_ArrayUtils_init_ioArrayName="${1:-}"
  ShellUtils.isVariableNameValid "$apash_ArrayUtils_init_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ShellUtils.isVariable "$apash_ArrayUtils_init_ioArrayName"          && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  MapUtils.isMap "$apash_ArrayUtils_init_ioArrayName"                && { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # If the variable is not declared, then create the corresponding global value.
  if ! ShellUtils.isDeclared "$apash_ArrayUtils_init_ioArrayName"; then
    ShellUtils.declareArray "$apash_ArrayUtils_init_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  # Only way found in zsh to reset an existing array and preserving its original scope
  # P: pointer, A: consider the pointed value as array and provide an existing empty array.
  if [ "$APASH_SHELL" = "zsh" ]; then
    : ${(PA)apash_ArrayUtils_init_ioArrayName::=${ArrayUtils_EMPTY_ARRAY[@]}} && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  else
    local -n apash_ArrayUtils_init_outArray="$apash_ArrayUtils_init_ioArrayName"
    apash_ArrayUtils_init_outArray=() && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  fi
  Log.out $LINENO; return "$APASH_FAILURE"
}
