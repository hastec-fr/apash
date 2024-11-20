#!/usr/bin/env bash

# Dependencies #################################################################
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
# ### Arguments
# | #      | varName              | Type          | in/out   | Default    | Description                          |
# |--------|----------------------|---------------|----------|------------|--------------------------------------|
# | $1     | apash_inArrayName    | ref(string[]) | in       |            |  Name of the array to get value.     |
# | $2     | apash_inIndex        | string        | in       |            | Index of the array.                  |
# | $3?    | apash_inDefaultValue | string        | in       | ""         | Default value if index is out of bounds. |
#
# ### Example
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
# @exitcode 0 When first argument is an array and the index is in the bound of the array without declaring a default value.
# @exitcode 1 Otherwise.
#/
ArrayUtils.get() {
  Log.in $LINENO "$@"
  local apash_inArrayName="${1:-}"
  local apash_inIndex="${2:-}"
  local apash_inDefaultValue="${3:-}"
  
  ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  # Check if the index is valid for the array
  if ! ArrayUtils.isArrayIndexValid "$apash_inArrayName" "$apash_inIndex"; then
    [[ $# -ne 3 ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
    echo "$apash_inDefaultValue" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  # Display the value of the corresponding array index.
  if [ "$APASH_SHELL" = "zsh" ]; then
    echo "${${(P)apash_inArrayName}[$apash_inIndex]}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  else
    local -n apash_inArray="$apash_inArrayName"
    echo "${apash_inArray[$apash_inIndex]}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  fi

  Log.out $LINENO; return "$APASH_SUCCESS"
}
