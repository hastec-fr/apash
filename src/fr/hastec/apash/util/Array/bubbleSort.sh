#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

##/
# @name Array.sort
# @brief Sorts the specified array into alphanumerical order with the bubble sort style.
# @description
#   This is for bash 4.3 and under which does not have the option -d of readarray.
#   
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inArrayName    | ref(string[]) | in & out |            | The array to sort.                    |
#
# ### Example
# ```bash
#    myArray=("a" "b" "c")
#    Array.sort "myArray"  # ("a" "b" "c")
#
#    myArray=("a" "c" "b")
#    Array.sort "myArray"  # ("a" "b" "c")
#
#    myArray=("beta-20" "beta-10" "beta-1")
#    Array.sort "myArray"  # ("beta-1" "beta-10" "beta-20")
#
#    myArray=("1" "a" "2" "3")
#    Array.sort "myArray"  # ("1" "2" "3" "a")
#   
#    myArray=("1" "")
#    Array.sort "myArray"  # ("" "1")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 True Whether the array is sorted according to natural ordering.
# @exitcode 1 Otherwise.
#/
Array.bubbleSort() {
  Log.entry "$LINENO" "$@"
  local inArrayName="$1"
  ArrayUtils.nullToEmpty "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  local lastIndex
  local temp i j
  local outArray=()
  ArrayUtils.clone "$inArrayName" "outArray"
  lastIndex=$(ArrayUtils.getLastIndex "$inArrayName") || return "$APASH_FUNCTION_FAILURE"

  # Performing Bubble sort
  for ((i=APASH_ARRAY_FIRST_INDEX; i < APASH_ARRAY_FIRST_INDEX+lastIndex+1; i++)); do
    for ((j=APASH_ARRAY_FIRST_INDEX; j < APASH_ARRAY_FIRST_INDEX+lastIndex+1-i-1; j++)); do
      if [[ "${outArray[j]}" > "${outArray[j+1]}" ]]; then
          temp="${outArray[j]}"
          outArray[j]="${outArray[j+1]}"
          outArray[j+1]="$temp"
      fi
    done
  done
  ArrayUtils.clone "outArray" "$inArrayName"

  return "$APASH_FUNCTION_SUCCESS"
}
