#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndexValid
apash.import fr.hastec.apash.commons-lang.ArrayUtils.remove
apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeDuplicates
apash.import fr.hastec.apash.util.Array.sort
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.removeAll
# @brief Removes the elements at the specified positions from the specified array.
# @description
#   All remaining elements are shifted to the left.
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
# | $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array to modify.        |
# | ${@:2} | inIndexes      | numbers...    | in       |            |  The indexes of the array to remove. |
#
# ### Example
# ```bash
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.removeAll  "myArray"            # failure
#    ArrayUtils.removeAll  "myArray"  "4"       # ("a" "b" "c" "")
#    ArrayUtils.removeAll  "myArray"  "0" "2"   # ("b" "")
#    ArrayUtils.removeAll  "myArray"  "-1"      # failure - ("b" "")
#
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.removeAll  "myArray"  "1" "1"   # ("a" "c" "" "d")
#
#    myArray=("a")
#    ArrayUtils.removeAll  "myArray"  "4"       # failure - (a)
#    ArrayUtils.removeAll  "myArray"  "0"       # ()
#    ArrayUtils.removeAll  "myArray"  "0"       # failure - ()
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When first argument is an array and all indexes are valid numbers.
# @exitcode 1 Otherwise.
#/
ArrayUtils.removeAll() {
  Log.in $LINENO "$@"
  [ $# -lt 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }

  local ioArrayName="$1"
  local indexes=()
  local index=""
  ArrayUtils.isArray "$ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  shift  
  
  for index in "$@"; do
    ArrayUtils.isArrayIndexValid "$ioArrayName" "$index"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    indexes+=("$index")
  done
  
  ArrayUtils.removeDuplicates "indexes" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Array.sort "indexes"                  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  # Create local array to prevent partial modification.
  local apash_ArrayUtils_removeAll_outArray=()
  ArrayUtils.clone "$ioArrayName" "apash_ArrayUtils_removeAll_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  for ((i=APASH_ARRAY_FIRST_INDEX+${#indexes[@]}-1; i >= APASH_ARRAY_FIRST_INDEX; i--)); do
    ArrayUtils.remove "apash_ArrayUtils_removeAll_outArray" "${indexes[i]}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  done

  ArrayUtils.clone "apash_ArrayUtils_removeAll_outArray" "$ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
