#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

# File description ###########################################################
# @name ArrayUtils.concat
# @brief Concatenate multiple arrays
# @description
#   The output array can be one of the input array (modified at the end).
#   
# ### Since:
# 0.2.0
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
# | $1     | outArrayName   | ref(string[]) | out      |            | Name of the array with concatenated values.          |
# | ${@:2} | inArrayName*   | ref(string[]) | in       |            | Name of the arrays to concatenate.        |
#
# #### Example
# ```bash
#    local outArray=()
#    myArray1=("a" "b" "c")
#    myArray2=("d" "e")
#    myArray2[3]="f"
#    ArrayUtils.countMathes outArray "myArray1" "myArray2" # ("a" "b" "c" "d" "e" "" "f")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When all arguments are arrays.
# @exitcode 1 Otherwise.
ArrayUtils.concat() {
  [ $# -lt 1 ] && return "$APASH_FUNCTION_FAILURE"

  local outArrayName="$1"
  local ref_ArrayUtils_concat_outArray=()
  local arrayName
  local -i i counter=0
  shift

  ArrayUtils.nullToEmpty "$outArrayName" || return "$APASH_FUNCTION_FAILURE"

  for arrayName in "$@"; do
    ArrayUtils.isArray "$arrayName" || return "$APASH_FUNCTION_FAILURE"
  done

  for arrayName in "$@"; do
    if [ "$APASH_SHELL" = "zsh" ]; then
      [[ ${#${(P)arrayName[@]}} == 1 && ${${(P)arrayName}[@]} == "" ]] \
         && ref_ArrayUtils_concat_outArray+=("") \
         || ref_ArrayUtils_concat_outArray+=("${${(P)arrayName}[@]}")
    else
      # Loop on potential discontinued indexes
      local -n inArray="$arrayName"
      [[ ${#inArray[@]} -eq 0 ]] && continue
      for i in "${!inArray[@]}"; do
        ref_ArrayUtils_concat_outArray[counter+i]="${inArray[i]}"
      done
      counter=$(ArrayUtils.getLastIndex "ref_ArrayUtils_concat_outArray") || return "$APASH_FUNCTION_FAILURE"
      ((counter++))
    fi
  done

  ArrayUtils.clone "ref_ArrayUtils_concat_outArray" "$outArrayName" && return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}