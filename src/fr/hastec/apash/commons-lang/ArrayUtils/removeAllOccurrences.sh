#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeAll
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

##/
# @name ArrayUtils.removeAllOccurrences
# @brief Removes the occurrences of the specified element from the specified array.
# @description
#   All subsequent elements are shifted to the left (subtracts one from their indices). 
#   If the array doesn't contains such an element, no elements are removed from the array.
#   Not defined cells will be considered as ""
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
# | $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array to modify.        |
# | $2     | inValue        | string        | in       |            |  The value to remove from the array. |
#
# ### Example
# ```bash
#    myArray=("a" "b" "a" "c" "" "d")
#    ArrayUtils.removeAllOccurrences  "myArray"            # failure
#    ArrayUtils.removeAllOccurrences  "myArray"  "a"       # ("b" "c" "" "d")
#    ArrayUtils.removeAllOccurrences  "myArray"  ""        # ("b" "c" "d")
#    ArrayUtils.removeAllOccurrences  "myArray"  "e"       # ("b" "c" "d")
#
#    myArray=("a")
#    ArrayUtils.removeAllOccurrences  "myArray"  "a"       # ()
#    ArrayUtils.removeAllOccurrences  "myArray"  "a"       # ()
#
#   myArray=("a" "b" "" "c")
#   myArray[10]="z"
#   ArrayUtils.removeAllOccurrences  "myArray"  ""         # ("a" "b" "c" "z")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When all arguments are removed from the array.
# @exitcode 1 Otherwise.
#/
ArrayUtils.removeAllOccurrences() {
  Log.entry "$LINENO" "$@"
  [ $# -ne 2 ] && return "$APASH_FUNCTION_FAILURE"

  local ioArrayName="$1"
  local inValue="$2"
  local lastIndex
  local i

  lastIndex=$(ArrayUtils.getLastIndex "$ioArrayName") || return "$APASH_FUNCTION_FAILURE"

  local outArray=()
  ArrayUtils.clone "$ioArrayName" "outArray" || return "$APASH_FUNCTION_FAILURE"
  
  # Get all indexes to remove
  for ((i=lastIndex; i >= APASH_ARRAY_FIRST_INDEX; i--)); do
    if [[ "${outArray[i]}" == "$inValue" ]]; then
      ArrayUtils.remove "outArray" $i || return "$APASH_FUNCTION_FAILURE"
    fi
  done

  ArrayUtils.clone "outArray" "$ioArrayName" || return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}