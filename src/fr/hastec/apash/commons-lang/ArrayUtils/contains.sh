#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
[ "$APASH_SHELL" = "zsh" ] && apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.contains
# @brief Checks if the value is in the given array.
# @description
#   The method returns false if empty array is passed in.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName           | Type          | in/out   | Default    | Description                          |
# |--------|-------------------|---------------|----------|------------|--------------------------------------|
# | $1     | apash_inArrayName | ref(string[]) | in       |            | Name of the array to check.          |
# | $2     | apash_inValue     | string        | in       |            | Value to find in the array.          |
#
# ### Example
# ```bash
#    myArray=("a" "b" "" "c")
#    ArrayUtils.contains  "myArray"          # false
#    ArrayUtils.contains  "myArray"  "d"     # false
#    ArrayUtils.contains  "myArray"  ""      # true
#    ArrayUtils.contains  "myArray"  "b"     # true
#    ArrayUtils.contains  "myArray"  "a b"   # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When first argument is an array and a value to find is provided.
# @exitcode 1 Otherwise.
#/
ArrayUtils.contains() {
  Log.in $LINENO "$@"
  local apash_inArrayName="${1:-}"
  local apash_inValue="${2:-}"
  local apash_value=""

  # If no array and value passed or array is invalid, then fails.
  [ $# -ne 2 ]                            && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if [ "$APASH_SHELL" = "zsh" ]; then
    local -a apash_inArray=()
    ArrayUtils.clone "$apash_inArrayName" apash_inArray || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  else
    # shellcheck disable=SC2178
    local -n apash_inArray="$apash_inArrayName"
  fi 
  
  # For each value in the array, check if it matches with the expected value.
  for apash_value in "${apash_inArray[@]:-}"; do
    [[ "$apash_value" == "$apash_inValue" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  done

  Log.out $LINENO; return "$APASH_FAILURE"
}
