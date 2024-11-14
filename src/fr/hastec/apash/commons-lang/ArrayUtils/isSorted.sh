#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
[ "$APASH_SHELL" = "zsh" ] && apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.isSorted
# @brief This method checks whether the provided array is sorted according to natural ordering.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ### Authors:
# * Benjamin VARGIN
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
#
# #### Example
# ```bash
#    myArray=()
#    ArrayUtils.isSorted "myArray"  # true
#
#    myArray=("a" "b" "c")
#    ArrayUtils.isSorted "myArray"  # true
#
#    myArray=("a" "c" "b")
#    ArrayUtils.isSorted "myArray"  # false
#
#    myArray=("beta-1" "beta-10" "beta-20")
#    ArrayUtils.isSorted "myArray"  # true
#
#    myArray=("1" "a")
#    ArrayUtils.isSorted "myArray"  # true
#   
#    myArray=("" "1")
#    ArrayUtils.isSorted "myArray"  # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 True Whether the array is sorted according to natural ordering.
# @exitcode 1 Otherwise.
#/
ArrayUtils.isSorted() {
  Log.entry "$LINENO" "$@"
  local inArrayName="$1"
  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"
  if [ "$APASH_SHELL" = "zsh" ]; then
    local ref_ArrayUtils_sorted_inArray=()
    ArrayUtils.clone "$inArrayName" ref_ArrayUtils_sorted_inArray
  else
    local -n ref_ArrayUtils_sorted_inArray="$inArrayName"
  fi

  for (( i=$APASH_ARRAY_FIRST_INDEX; i < APASH_ARRAY_FIRST_INDEX+${#ref_ArrayUtils_sorted_inArray[@]}-1; i++ )); do
    [[ "${ref_ArrayUtils_sorted_inArray[i]}" > "${ref_ArrayUtils_sorted_inArray[i+1]}" ]] && return "$APASH_FUNCTION_FAILURE"
  done

  return "$APASH_FUNCTION_SUCCESS"
}
