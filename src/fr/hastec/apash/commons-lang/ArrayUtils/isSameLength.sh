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
# | #      | varName              | Type          | in/out   | Default    | Description                          |
# |--------|----------------------|---------------|----------|------------|--------------------------------------|
# | $1     | apash_inArrayName1   | ref(string[]) | in       |            | The first array to compare.          |
# | $2     | apash_inArrayName2   | ref(string[]) | in       |            | The second array to compare.         |
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
  Log.in $LINENO "$@"
  local apash_inArrayName1="${1:-}"
  local apash_inArrayName2="${2:-}"
  ArrayUtils.isArray "$apash_inArrayName1" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.isArray "$apash_inArrayName2" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if [ $APASH_SHELL = "zsh" ]; then
    [[ ${#${(P)apash_inArrayName1}[@]} -ne ${#${(P)apash_inArrayName2}[@]} ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
  else
    local -n apash_inArray1="$apash_inArrayName1"  
    local -n apash_inArray2="$apash_inArrayName2"  
    [[ ${#apash_inArray1[@]} -ne ${#apash_inArray2[@]} ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
  fi
  Log.out $LINENO; return "$APASH_SUCCESS"
}
