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
# | $1     | apash_inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
# | $2     | apash_inValue        | string        | in       |            | Value to find.                       |
# | $3 ?   | apash_inStart        | number        | in       | 0          | The index to start searching at.     |
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

  local apash_inArrayName="${1:-}"
  local apash_inValue="${2:-}"
  local apash_inStart="${3:-$APASH_ARRAY_FIRST_INDEX}"
  local -i apash_i
  local apash_lastIndex
  NumberUtils.isLong "$apash_inStart" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_inArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  [[ $apash_inStart -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inStart=$APASH_ARRAY_FIRST_INDEX
  if [ "$APASH_SHELL" = "zsh" ]; then
    for (( apash_i=apash_inStart; apash_i < apash_lastIndex+1 ; apash_i++ )); do
      [[ "${${(P)apash_inArrayName}[apash_i]}" == "$apash_inValue" ]] && echo "$apash_i" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    done
  else
    local -n apash_inArray="$apash_inArrayName"
    for (( apash_i=apash_inStart; apash_i < apash_lastIndex+1 ; apash_i++ )); do
      [[ "${apash_inArray[apash_i]}" == "$apash_inValue" ]] && echo "$apash_i" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    done
  fi
  
  # Return default value if not found
  echo "$ArrayUtils_INDEX_NOT_FOUND" || { Log.out $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
