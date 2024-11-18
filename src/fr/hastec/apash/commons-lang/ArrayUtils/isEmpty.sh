#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

##/
# @name ArrayUtils.isEmpty
# @brief Checks if an array exist and is empty.
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
# | $1     | inArrayName    | ref(string[]) | in       |            | The array to check.                  |
#
# ### Example
# ```bash
#    ArrayUtils.isEmpty "myArray"       # false
#
#    myArray=()
#    ArrayUtils.isEmpty "myArray"       # true
#
#    myArray=("a")
#    ArrayUtils.isEmpty "myArray"       # false
#
#    myArray=("")
#    ArrayUtils.isEmpty "myArray"       # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 Whether the given array has no element.
# @exitcode 1 Otherwise.
#/
ArrayUtils.isEmpty() {
  Log.in $LINENO "$@"
  local inArrayName="$1"

  ArrayUtils.isArray "$inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if [ "$APASH_SHELL" = "zsh" ]; then
    [[ ${#${(P)inArrayName}[@]} -ne 0 ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
  else
    local -n inArray="$inArrayName"
    [[ ${#inArray[@]} -ne 0 ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
  fi
  Log.out $LINENO; return "$APASH_SUCCESS"
}
