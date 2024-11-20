#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndexValid
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.remove
# @brief Removes the element at the specified position from the specified array.
# @description
#   All subsequent elements are shifted to the left (subtracts one from their indices).
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
# | $2     | inIndex        | number        | in       |            |  The index of the array to remove.   |
#
# ### Example
# ```bash
#    myArray=("a" "b" "c" "" "d")
#    ArrayUtils.remove  "myArray"            # failure
#    ArrayUtils.remove  "myArray"  "4"       # ("a" "b" "c" "")
#    ArrayUtils.remove  "myArray"  "2"       # ("a" "b" "")
#    ArrayUtils.remove  "myArray"  "0"       # ("b" "")
#    ArrayUtils.remove  "myArray"  "-1"      # failure
#
#    myArray=("a")
#    ArrayUtils.remove  "myArray"  "4"       # failure
#    ArrayUtils.remove  "myArray"  "0"       # ()
#    ArrayUtils.remove  "myArray"  "0"       # failure
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When first argument is an array and the index is valid.
# @exitcode 1 Otherwise.
#/
ArrayUtils.remove() {
  Log.in $LINENO "$@"
  [ $# -ne 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }

  local ioArrayName="${1:-}"
  local inIndex="${2:-}"
  local i
  ArrayUtils.isArray "$ioArrayName"                       || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.isArrayIndexValid "$ioArrayName" "$inIndex"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  local -a apash_outArray=()

  if [ "$APASH_SHELL" = "zsh" ]; then
    apash_outArray=("${${(P)ioArrayName}[@]:0:$((inIndex-APASH_ARRAY_FIRST_INDEX))}" \
                                   "${${(P)ioArrayName}[@]:$((inIndex-APASH_ARRAY_FIRST_INDEX+1))}")
  else
    ArrayUtils.clone "$ioArrayName" apash_outArray || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    unset "apash_outArray[$inIndex]"

    # Shift to the left all next cells
    for i in "${!apash_outArray[@]}"; do
      [[ $i -lt $inIndex ]] && continue
      apash_outArray[i-1]=${apash_outArray[i]}
      unset "apash_outArray[$i]"
    done
  fi
  ArrayUtils.clone "apash_outArray" "$ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
