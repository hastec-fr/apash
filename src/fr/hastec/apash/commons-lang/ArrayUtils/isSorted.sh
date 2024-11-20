#!/usr/bin/env bash

# Dependencies #################################################################
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
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | apash_inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
#
# ### Example
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
  Log.in $LINENO "$@"
  local apash_inArrayName="${1:-}"
  local -i apash_i
  ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  if [ "$APASH_SHELL" = "zsh" ]; then
    local apash_inArray=()
    ArrayUtils.clone "$apash_inArrayName" apash_inArray || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  else
    local -n apash_inArray="$apash_inArrayName"
  fi

  for (( apash_i=APASH_ARRAY_FIRST_INDEX; apash_i < APASH_ARRAY_FIRST_INDEX+${#apash_inArray[@]}-1; apash_i++ )); do
    [[ "${apash_inArray[apash_i]}" > "${apash_inArray[apash_i+1]}" ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
  done

  Log.out $LINENO; return "$APASH_SUCCESS"
}
