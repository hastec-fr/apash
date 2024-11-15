#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

##/
# @name ArrayUtils.isSameLength
# @brief Checks whether two arrays are the same length, return false if it's not an array.
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
# | $1     | inArrayName1   | ref(string[]) | in       |            | The first array to compare.          |
# | $2     | inArrayName2   | ref(string[]) | in       |            | The second array to compare.         |
#
# ### Example
# ```bash
#    myArray=()
#    ArrayUtils.isSameLength "myArray"  "myArray" # true
#    ArrayUtils.isSameLength "myArray"  ""        # false
#
#    myArray1=("a")
#    myArray2=("b")
#    ArrayUtils.isSameLength "myArray1" "myArray2" # true
#
#    myArray1=("a")
#    myArray2=("a" "b")
#    ArrayUtils.isSameLength "myArray"  "myArray2" # false
#
#    myArray1=("a")
#    myArray2=("a" "b")
#    myArray1[10]=z
#    ArrayUtils.isSameLength "myArray"  "myArray2" # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 True if length of arrays matches.
# @exitcode 1 Otherwise.
#/
ArrayUtils.isSameLength() {
  Log.entry "$LINENO" "$@"
  local inArrayName1="$1"
  local inArrayName2="$2"
  ArrayUtils.isArray "$inArrayName1" || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArray "$inArrayName2" || return "$APASH_FUNCTION_FAILURE"

  if [ $APASH_SHELL = "zsh" ]; then
    [[ ${#${(P)inArrayName1}[@]} -ne ${#${(P)inArrayName2}[@]} ]] && return "$APASH_FUNCTION_FAILURE"
  else
    local -n inArray1="$inArrayName1" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
    local -n inArray2="$inArrayName2" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"  
    [[ ${#inArray1[@]} -ne ${#inArray2[@]} ]] && return "$APASH_FUNCTION_FAILURE"
  fi
  return "$APASH_FUNCTION_SUCCESS"
}
