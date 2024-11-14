#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.sh
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong
[ "$APASH_SHELL" =  "zsh" ] && apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.lastIndexOf
# @brief Finds the last index of the given value in the array starting at the given index.
# @description
#   A negative startIndex is treated as zero. A startIndex larger than the array length will return an empty
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inArrayName    | ref(string[]) | in       |            |  Name of the array to check.         |
# | $2     | inValue        | string        | in       |            |  Value to find.                      |
# | $3 ?   | inStart        | number        | in       | 0          |  The index to start searching at .   |
#
# #### Example
# ```bash
#    myIndexes=()
#    myArray=("a" "b" "" "c" "b")
#    ArrayUtils.lastIndexOf  "myArray" "b"       # ("4")
#    ArrayUtils.lastIndexOf  "myArray" ""        # ("2")
#    ArrayUtils.lastIndexOf  "myArray"           # failure
#
#    myIndexes=(1 2)
#    myArray=("a" "b")
#    ArrayUtils.lastIndexOf  "myArray" "c"       # -1
#    ArrayUtils.lastIndexOf  "myArray" "a" "3"   # -1
#    ArrayUtils.lastIndexOf  "myArray" "a" "-1"  # 0
#    ArrayUtils.lastIndexOf  "myArray" ""        # -1
#  ```
#
# @stdout The last index of the value within the array, ArrayUtils_INDEX_NOT_FOUND (-1) if not found.
# @stderr None.
#
# @exitcode 0 When input array references exist and start index is an integer (when declared).
# @exitcode 1 Otherwise.
#/
ArrayUtils.lastIndexOf() {
  Log.entry "$LINENO" "$@"
  # If no value to find explicitly declared, then return
  [[ $# -lt 2 ]] && return "$APASH_FUNCTION_FAILURE"

  local inArrayName="$1"
  local inValue="$2"
  local inStart="${3:-0}"
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isLong "$inStart" || return "$APASH_FUNCTION_FAILURE"

  [[ $inStart -lt $APASH_ARRAY_FIRST_INDEX ]] && inStart=$APASH_ARRAY_FIRST_INDEX

  if [ "$APASH_SHELL" =  "zsh" ]; then
    local ref_ArrayUtils_lastIndexOf_inArray=()
    ArrayUtils.clone "$inArrayName" "ref_ArrayUtils_lastIndexOf_inArray"
  else
    local -n ref_ArrayUtils_lastIndexOf_inArray="$inArrayName"
  fi

  for ((i=APASH_ARRAY_FIRST_INDEX+${#ref_ArrayUtils_lastIndexOf_inArray[@]}-1; i >= inStart  ; i--)); do
    [[ "${ref_ArrayUtils_lastIndexOf_inArray[i]}" == "$inValue" ]] && echo "$i" && return "$APASH_FUNCTION_SUCCESS"
  done
  
  # Return default value if not found
  echo "$ArrayUtils_INDEX_NOT_FOUND"
  return "$APASH_FUNCTION_FAILURE"
}
