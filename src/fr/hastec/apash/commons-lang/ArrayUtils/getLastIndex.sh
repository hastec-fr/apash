#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

##/
# @name ArrayUtils.getLastIndex
# @brief Return the last index of the given array.
# @description
#   Empty string is returned if the array is empty.
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
# | $1     | apash_inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
#
# ### Example
# ```bash
#    myArray=()
#    ArrayUtils.getLastIndex  "myArray"        # "-1"
#
#    myArray=("a" "b" "" "c" "b")
#    ArrayUtils.getLastIndex  "myArray"        # 4
#
#    myArray[9223372036854775807]=z
#    ArrayUtils.getLastIndex  "myArray"        # 9223372036854775807
#  ```
#
# @stdout The last index of the array.
# @stderr None.
#
# @exitcode 0 When input array references exist.
# @exitcode 1 Otherwise.
#/
ArrayUtils.getLastIndex() {
  Log.in $LINENO "$@"
  local apash_inArrayName="${1:-}"

  ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # In zsh, no discontinued indexes in the array so it returns length minus the start index.
  if [ "$APASH_SHELL" = "zsh" ]; then
    local apash_arrayLength=${#${(P)apash_inArrayName}[@]}
    [[ $apash_arrayLength == 0 ]] && echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    echo "$(( APASH_ARRAY_FIRST_INDEX == 0 ? apash_arrayLength -  1 : apash_arrayLength))" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  else # bash
    local -n apash_inArray="$apash_inArrayName"
    [[ ${#apash_inArray[@]} == 0 ]] && echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    local apash_indexes=("${!apash_inArray[@]}")
    echo "${apash_indexes[-1]}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    # echo "${!apash_inArray[@]}" | awk '{print $NF}' && return "$APASH_SUCCESS"
  fi
  
  Log.out $LINENO; return "$APASH_FAILURE"
}
