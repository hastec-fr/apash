#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

##/
# @name ArrayUtils.isSameLastIndex
# @brief Checks whether two arrays are the same length, return false if it's not an array.
#
# ## History
# @since 0.2.0 (hastec-fr)
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
#    ArrayUtils.isSameLastIndex "myArray"  "myArray"  # true
#    ArrayUtils.isSameLastIndex "myArray"  ""         # false
#
#    myArray1=("a")
#    myArray2=("b")
#    ArrayUtils.isSameLastIndex "myArray1" "myArray2" # true
#
#    myArray1=("a")
#    myArray2=("a" "b")
#    ArrayUtils.isSameLastIndex "myArray"  "myArray2" # false
#
#    myArray1=("a")
#    myArray2=("a" "b")
#    myArray1[10]=z
#    ArrayUtils.isSameLength "myArray"  "myArray2"    # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 True if length of arrays matches.
# @exitcode 1 Otherwise.
#/
ArrayUtils.isSameLastIndex() {
  Log.in $LINENO "$@"
  local inArrayName1="${1:-}"
  local inArrayName2="${2:-}"
  local lastIndex1
  local lastIndex2
  lastIndex1=$(ArrayUtils.getLastIndex "$inArrayName1") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  lastIndex2=$(ArrayUtils.getLastIndex "$inArrayName2") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  [[ $lastIndex1 -ne $lastIndex2 ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
