#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.remove
apash.import fr.hastec.apash.commons-lang.ArrayUtils.indexOf

##/
# @name ArrayUtils.removeElement
# @brief Removes the first occurrence of the specified element from the specified array.
# @description
#   All subsequent elements are shifted to the left (subtracts one from their indices). 
#   If the array doesn't contains such an element, no elements are removed from the array.
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
# | $2     | inValue        | string        | in       |            |  The first occurence of the value to remove from the array.  |
#
# ### Example
# ```bash
#    myArray=("a" "b" "a" "c" "" "d")
#    ArrayUtils.removeElement  "myArray"            # failure
#    ArrayUtils.removeElement  "myArray"  "a"       # ("b" "a" "c" "" "d")
#    ArrayUtils.removeElement  "myArray"  "a"       # ("b" "c" "" "d")
#    ArrayUtils.removeElement  "myArray"  ""        # ("b" "c" "d")
#    ArrayUtils.removeElement  "myArray"  "e"       # ("b" "c" "d")
#
#    myArray=("a")
#    ArrayUtils.removeElement  "myArray"  "a"       # ()
#    ArrayUtils.removeElement  "myArray"  "a"       # ()
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the first occurence is removed from the array.
# @exitcode 1 Otherwise.
#/
ArrayUtils.removeElement() {
  Log.in $LINENO "$@"
  [ $# -ne 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  local ioArrayName="${1:-}"
  local inValue="${2:-}"
  local index
  ArrayUtils.isArray "$ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  # Get the index to remove
  index=$(ArrayUtils.indexOf "$ioArrayName" "$inValue")
  [[ "$index" = "$ArrayUtils_INDEX_NOT_FOUND" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  ArrayUtils.remove "$ioArrayName" "$index"      || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
