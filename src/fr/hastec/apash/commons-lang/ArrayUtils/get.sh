#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndexValid

##/
# @name ArrayUtils.get
# @brief Gets the nTh element of an array or a default value if the index is out of bounds.
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
# | $1     | inArrayName    | ref(string[]) | in       |            |  Name of the array to get value.     |
# | $2     | inIndex        | string        | in       |            | Index of the array.                  |
# | $3?    | inDefaultValue | string        | in       | ""         | Default value if index is out of bounds. |
#
# #### Example
# ```bash
#    myArray=("a" "b" "" "c")
#    ArrayUtils.get  "myArray"              # ""  - failure
#    ArrayUtils.get  "myArray"  "0"         # "a"
#    ArrayUtils.get  "myArray"  "3"         # "c"
#    ArrayUtils.get  "myArray"  "-1"        # ""  - failure
#    ArrayUtils.get  "myArray"  "a" " "     # " "
#    ArrayUtils.get  "myArray"  "-1" " "    # " "
#    ArrayUtils.get  "myArray"  "5"  "foo"  # "foo"
# ```
#
# @stdout The nTh element of an array or a default value if the index is out of bounds (and default value is explicitly declared).
# @stderr None.
#
# @exitcode 0 When first argument is an array and the index is in the bound of the array without declared default value.
# @exitcode 1 Otherwise.
#/
ArrayUtils.get() {
  Log.entry "$LINENO" "$@"
  local inArrayName="$1"
  local inIndex="$2"
  local inDefaultValue="$3"
  
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  
  # Check if the index is valid for the array
  if ! ArrayUtils.isArrayIndexValid "$inArrayName" "$inIndex"; then
    [[ $# -ne 3 ]] && return "$APASH_FUNCTION_FAILURE"
    echo "$inDefaultValue" || return "$APASH_FUNCTION_FAILURE"
    return "$APASH_FUNCTION_SUCCESS"
  fi

  # Display the value of the corresponding array index.
  if [ "$APASH_SHELL" = "zsh" ]; then
    echo "${${(P)inArrayName}[$inIndex]}" || return "$APASH_FUNCTION_FAILURE"
  else
    local -n inArray="$inArrayName"
    echo "${inArray[$inIndex]}" || return "$APASH_FUNCTION_FAILURE"
  fi

  return "$APASH_FUNCTION_SUCCESS"
}
