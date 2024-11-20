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
# | $1     | apash_inArrayName    | ref(string[]) | in & out |            | The array to sort.                    |
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
  Log.in $LINENO "$@"
  local apash_inArrayName="${1:-}"
  local apash_lastIndex
  local apash_temp
  local -a apash_outArray=()
  local -i apash_i apash_j

  ArrayUtils.nullToEmpty "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.clone "$apash_inArrayName" "apash_outArray"
  apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_inArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # Performing Bubble sort
  for (( apash_i=APASH_ARRAY_FIRST_INDEX; apash_i < APASH_ARRAY_FIRST_INDEX+apash_lastIndex+1; apash_i++ )); do
    for (( apash_j=APASH_ARRAY_FIRST_INDEX; apash_j < APASH_ARRAY_FIRST_INDEX+apash_lastIndex+1-apash_i-1; apash_j++ )); do
      if [[ "${apash_outArray[apash_j]}" > "${apash_outArray[apash_j+1]}" ]]; then
          apash_temp="${apash_outArray[apash_j]}"
          apash_outArray[apash_j]="${apash_outArray[apash_j+1]}"
          apash_outArray[apash_j+1]="$apash_temp"
      fi
    done
  done
  ArrayUtils.clone "apash_outArray" "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
