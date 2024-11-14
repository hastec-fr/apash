#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

##/
# @name ArrayUtils.countMatches
# @brief Return the number of cells having the given value
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName           | Type          | in/out   | Default    | Description                          |
# |--------|-------------------|---------------|----------|------------|--------------------------------------|
# | $1     | apash_inArrayName | ref(string[]) | in       |            | Name of the array to check.          |
# | $2     | apash_inValue     | string        | in       | ""         | Value to find in the array.          |
#
# #### Example
# ```bash
#    myArray=("a" "b" "" "a" "c" "" "")
#    ArrayUtils.countMatches  "myArray"              # 3
#    ArrayUtils.countMatches  "myArray"  "d"         # 0
#    ArrayUtils.countMatches  "myArray"  "b"         # 1
#    ArrayUtils.countMatches  "myArray"  "a"         # 2
# ```
#
# @stdout The number of cells having the given value.
# @stderr None.
#
# @exitcode 0 When first argument is an array.
# @exitcode 1 Otherwise.
#/
ArrayUtils.countMatches() {
  Log.entry "$LINENO" "$@"
  local apash_inArrayName="$1"
  local apash_inValue="$2"
  local apash_value
  local -i apash_counter=0

  # Check if it's an array then count the number of occurence of the value inside.
  ArrayUtils.isArray "$apash_inArrayName" || return "$APASH_FUNCTION_FAILURE"
  if [ "$APASH_SHELL" = "zsh" ]; then
    for apash_value in "${${(P)apash_inArrayName}[@]}"; do
      [[ "$apash_value" == "$apash_inValue" ]] && ((apash_counter++))
    done
  else
    local -n inArray="$apash_inArrayName"
    for apash_value in "${inArray[@]}"; do
      [[ "$apash_value" == "$apash_inValue" ]] && ((apash_counter++))
    done
  fi
  
  # Return the number of occurence encountered.
  echo "$apash_counter" || return "$APASH_FUNCTION_FAILURE"
  return "$APASH_FUNCTION_SUCCESS"
}
