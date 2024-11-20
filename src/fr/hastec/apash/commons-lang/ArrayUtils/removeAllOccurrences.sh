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
# | #      | varName                           | Type          | in/out   | Default    | Description                          |
# |--------|-----------------------------------|---------------|----------|------------|--------------------------------------|
# | $1     | apash_ArrayUtils_rao_ioArrayName  | ref(string[]) | in       |            |  Name of the array to modify.        |
# | $2     | apash_inValue                     | string        | in       |            |  The value to remove from the array. |
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
  Log.in $LINENO "$@"
  [ $# -ne 2 ] && return "$APASH_FAILURE"

  local apash_ArrayUtils_rao_ioArrayName="${1:-}"
  local apash_inValue="${2:-}"
  local apash_lastIndex
  local -a apash_ArrayUtils_rao_outArray=()
  local -i apash_i

  apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_ArrayUtils_rao_ioArrayName")       || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.clone "$apash_ArrayUtils_rao_ioArrayName" "apash_ArrayUtils_rao_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  # Get all indexes to remove
  for (( apash_i=apash_lastIndex; apash_i >= APASH_ARRAY_FIRST_INDEX; apash_i-- )); do
    if [[ "${apash_ArrayUtils_rao_outArray[apash_i]:-}" == "$apash_inValue" ]]; then
      ArrayUtils.remove "apash_ArrayUtils_rao_outArray" $apash_i || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    fi
  done

  ArrayUtils.clone "apash_ArrayUtils_rao_outArray" "$apash_ArrayUtils_rao_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
