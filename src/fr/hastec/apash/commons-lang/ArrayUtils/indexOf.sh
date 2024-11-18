#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong


##/
# @name ArrayUtils.indexOf
# @brief Finds the first index of the given value in the array starting at the given index.
# @description
#   A negative startIndex is treated as zero. 
#   A startIndex larger than the array length will return an empty.
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
# | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
# | $2     | inValue        | string        | in       |            | Value to find.                       |
# | $3 ?   | inStart        | number        | in       | 0          | The index to start searching at.     |
#
# ### Example
# ```bash
#    myIndexes=()
#    myArray=("a" "b" "" "c" "b")
#    ArrayUtils.indexOf  "myArray" "b"       # ("1")
#    ArrayUtils.indexOf  "myArray" ""        # ("2")
#    ArrayUtils.indexOf  "myArray"           # () - failure
#
#    myIndexes=(1 2)
#    myArray=("a" "b")
#    ArrayUtils.indexOf  "myArray" "c"       # -1
#    ArrayUtils.indexOf  "myArray" "a" "3"   # -1
#    ArrayUtils.indexOf  "myArray" "a" "-1"  # 0
#    ArrayUtils.indexOf  "myArray" ""        # -1
# ```
#
# @stdout The index of the value within the array, ArrayUtils_INDEX_NOT_FOUND (-1) if not found.
# @stderr None.
#
# @exitcode 0 When input array references exist and start index is an integer (when declared).
# @exitcode 1 Otherwise.
#/
ArrayUtils.indexOf() {
  Log.in $LINENO "$@"

  # If no value to find explicitly declared, then return
  [[ $# -lt 2 ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }

  local inArrayName="$1"
  local inValue="$2"
  local inStart="${3:-0}"
  local i
  local lastIndex
  NumberUtils.isLong "$inStart" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  lastIndex=$(ArrayUtils.getLastIndex "$inArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  [[ $inStart -lt $APASH_ARRAY_FIRST_INDEX ]] && inStart=$APASH_ARRAY_FIRST_INDEX
  if [ "$APASH_SHELL" = "zsh" ]; then
    for ((i = inStart; i < lastIndex+1 ; i++)); do
      [[ "${${(P)inArrayName}[i]}" == "$inValue" ]] && echo "$i" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    done
  else
    local -n inArray="$inArrayName"
    for ((i = inStart; i < lastIndex+1 ; i++)); do
      [[ "${inArray[i]}" == "$inValue" ]] && echo "$i" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    done
  fi
  
  # Return default value if not found
  echo "$ArrayUtils_INDEX_NOT_FOUND" || { Log.out $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
