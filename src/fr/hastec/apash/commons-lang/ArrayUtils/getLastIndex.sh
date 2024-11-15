#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

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
# | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
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
  Log.entry "$LINENO" "$@"
  local inArrayName="$1"

  ArrayUtils.isArray "$inArrayName" || return "$APASH_FUNCTION_FAILURE"

  # In zsh, no discontinued indexes in the array so it returns length minus the start index.
  if [ "$APASH_SHELL" = "zsh" ]; then
    local arrayLength=${#${(P)inArrayName}[@]}
    [[ $arrayLength == 0 ]] && echo "-1" && return "$APASH_FUNCTION_SUCCESS"
    echo "$(( APASH_ARRAY_FIRST_INDEX == 0 ? arrayLength -  1 : arrayLength))" && return "$APASH_FUNCTION_SUCCESS"
  else # bash
    local -n inArray="$inArrayName" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"
    [[ ${#inArray[@]} == 0 ]] && echo "-1" && return "$APASH_FUNCTION_SUCCESS"
    local apash_indexes=("${!inArray[@]}")
    echo "${apash_indexes[-1]}" && return "$APASH_FUNCTION_SUCCESS"
    # echo "${!inArray[@]}" | awk '{print $NF}' && return "$APASH_FUNCTION_SUCCESS"
  fi
  
  return "$APASH_FUNCTION_FAILURE"
}
