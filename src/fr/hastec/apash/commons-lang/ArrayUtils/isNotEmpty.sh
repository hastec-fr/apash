#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.isNotEmpty
# @brief Checks if an array exist and has at least one element.
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
#    ArrayUtils.isNotEmpty "myArray"       # false
#
#    myArray=()
#    ArrayUtils.isNotEmpty "myArray"       # false
#
#    myArray=("a")
#    ArrayUtils.isNotEmpty "myArray"       # true 
#
#    myArray=("")
#    ArrayUtils.isNotEmpty "myArray"       # true 
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 Whether the given array has at least one element.
# @exitcode 1 Otherwise.
#/
ArrayUtils.isNotEmpty() {
  Log.in $LINENO "$@"
  local inArrayName="$1"

  ArrayUtils.isArray "$inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if [[ $APASH_SHELL == "zsh" ]]; then
    [[ ${#${(P)inArrayName}[@]} -eq 0 ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
  else
    local -n inArray="$inArrayName"
    [[ ${#inArray[@]} -eq 0 ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
  fi
  
  Log.out $LINENO; return "$APASH_SUCCESS"
}
