#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

# File description ###########################################################
# @name ArrayUtils.insert
# @brief Inserts elements into an array at the given index (starting from zero).
# @description
#
# ### Since:
# 0.1.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                          |
# |--------|----------------|---------------|----------|------------|--------------------------------------|
# | $1     | inIndex        | number        | in       |            | Positive index of the array to insert values. |
# | $2     | ref_ArrayUtilsInsert_ioArrayName    | ref(string[]) | in       |            | Name of the array to modify.                  |
# | ${@:3} | inValues       | string...     | in       |            | Values to insert at the indicated index.      |
#
# #### Example
# ```bash
#    ArrayUtils.insert  ""       ""          # failure
#    ArrayUtils.insert  "myVar"  "a"         # failure
#
#    declare -A myMap
#    ArrayUtils.insert  "myMap"  "a"         # failure
#
#    ioArray=()
#    ArrayUtils.insert  "0"           "ioArray"              # failure
#    ArrayUtils.insert  "0"           "ioArray"  "a"         # ("a")
#    ArrayUtils.insert  "${#ioArray}" "ioArray"  "b" ""      # ("a" "b" "")
#    ArrayUtils.insert  "2"           "ioArray"  "c" "d"     # ("a" "b" "c" "d" "")
#    ArrayUtils.insert  "1"           "ioArray"  "foo bar"   # ("a" "foo bar" "b" "c" "d" "")
#    ArrayUtils.insert  "-1"          "ioArray" "test"      # failure - ("a" "foo bar" "b" "c" "d" "")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When all elements are inserted.
# @exitcode 1 When the index is not a positive number or reference is not an array or there are no value to insert.
ArrayUtils.insert() {
  [ $# -lt 3 ] && return "$APASH_FUNCTION_FAILURE"

  local inIndex="$1"
  local ref_ArrayUtilsInsert_ioArrayName="$2"
  ArrayUtils.isArray "$ref_ArrayUtilsInsert_ioArrayName" || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.isArrayIndex "$inIndex"                     || return "$APASH_FUNCTION_FAILURE"  
  shift 2
  local inValues=("$@")
  local i j

  if [ "$APASH_SHELL" = "zsh" ]; then
    local ref_ArrayUtilsInsert_outArray=()
    ref_ArrayUtilsInsert_outArray=("${${(P)ref_ArrayUtilsInsert_ioArrayName}[@]:0:$((inIndex-APASH_ARRAY_FIRST_INDEX))}" \
                                   "${inValues[@]}" \
                                   "${${(P)ref_ArrayUtilsInsert_ioArrayName}[@]:$((inIndex-APASH_ARRAY_FIRST_INDEX))}")
    ArrayUtils.clone "ref_ArrayUtilsInsert_outArray" "$ref_ArrayUtilsInsert_ioArrayName" && return "$APASH_FUNCTION_SUCCESS"
  else
    local -n ref_ArrayUtilsInsert_ioArray="$ref_ArrayUtilsInsert_ioArrayName"
    local isInserted=false
    # Need to preserve indexes in bash
    for i in "${!ref_ArrayUtilsInsert_ioArray[@]}"; do
      if [[ $i -lt inIndex ]]; then
        ref_ArrayUtilsInsert_outArray[i]="${ref_ArrayUtilsInsert_ioArray[i]}"
      elif [[ $i -ge inIndex ]]; then
        if [[ $isInserted == false ]]; then
          for ((j=0; j < ${#inValues[@]}; j++ )); do
            ref_ArrayUtilsInsert_outArray[j+inIndex]=${inValues[j]}
          done
          isInserted=true
        fi
        ref_ArrayUtilsInsert_outArray[i+${#inValues[@]}]="${ref_ArrayUtilsInsert_ioArray[i]}"
      fi
    done
    
    # If the value have not been insert because after the last element
    # Then insert it at the demanded index.
    if [[ $isInserted == false ]]; then
      for ((i=0; i < ${#inValues[@]}; i++ )); do
        ref_ArrayUtilsInsert_outArray[i+inIndex]="${inValues[i]}"
      done
    fi
    ArrayUtils.clone "ref_ArrayUtilsInsert_outArray" "$ref_ArrayUtilsInsert_ioArrayName" && return "$APASH_FUNCTION_SUCCESS"
  fi

  return "$APASH_FUNCTION_FAILURE"
}
