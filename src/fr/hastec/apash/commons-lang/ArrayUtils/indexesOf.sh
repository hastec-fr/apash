#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.indexesOf
# @brief Finds the indices of the given value in the array starting at the given index.
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
# | $1     | outArrayName   | ref(string[]) | out      |            | Name of the output array storing result indexes.    |
# | $2     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
# | $3     | inValue        | string        | in       |            | Value to find.                       |
# | $4 ?   | inStart        | number        | in       | 0          | The index to start searching at.     |
#
#
# ### Example
# ```bash
#    myArray=("a" "b" "" "c" "b")
#    ArrayUtils.indexesOf "myIndexes" "myArray" "b"   # ("1" "4")
#
#    myIndexes=(1 2)
#    myArray=("a" "b")
#    ArrayUtils.indexesOf "myIndexes" "myArray" "c"       # ()
#    ArrayUtils.indexesOf "myIndexes" "myArray" "a" "3"   # ()
#    ArrayUtils.indexesOf "myIndexes" "myArray" "a" "-1"  # (0)
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When input array references exist.
# @exitcode 1 Otherwise.
#/
ArrayUtils.indexesOf() {
  Log.in $LINENO "$@"
  local outIndexesName="$1"
  ArrayUtils.nullToEmpty "$outIndexesName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  local inArrayName="$2"
  local inValue="$3"
  local inStart="${4:-0}"
  local i
  local outIndexes=()
  ArrayUtils.isArray "$inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  NumberUtils.isLong "$inStart"     || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  [[ $inStart -lt $APASH_ARRAY_FIRST_INDEX ]] && inStart=$APASH_ARRAY_FIRST_INDEX
  if [ "$APASH_SHELL" = "zsh" ]; then
    for ((i = inStart; i < APASH_ARRAY_FIRST_INDEX+${#inArrayName[@]} ; i++)); do
      [[ "${${(P)inArrayName}[i]}" == "$inValue" ]] && outIndexes+=("$i")
    done
  else
    local -n inArray="$inArrayName"
    for ((i = inStart; i < APASH_ARRAY_FIRST_INDEX+${#inArray[@]} ; i++)); do
      [[ "${inArray[i]}" == "$inValue" ]] && outIndexes+=("$i")
    done
  fi

  ArrayUtils.clone outIndexes "$outIndexesName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
