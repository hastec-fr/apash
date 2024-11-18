#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.insert
# @brief Inserts elements into an array at the given index (starting from zero).
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
# | $1     | inIndex        | number        | in       |            | Positive index of the array to insert values. |
# | $2     | ref_ArrayUtilsInsert_ioArrayName    | ref(string[]) | in       |            | Name of the array to modify.                  |
# | ${@:3} | inValues       | string...     | in       |            | Values to insert at the indicated index.      |
#
# ### Example
# ```bash
#    myArray=()
#    ArrayUtils.insert  "0"           "myArray"              # () - failure
#    ArrayUtils.insert  "0"           "myArray"  "a"         # ("a")
#    ArrayUtils.insert  "${#ioArray}" "myArray"  "b" ""      # ("a" "b" "")
#    ArrayUtils.insert  "2"           "myArray"  "c" "d"     # ("a" "b" "c" "d" "")
#    ArrayUtils.insert  "1"           "myArray"  "foo bar"   # ("a" "foo bar" "b" "c" "d" "")
#    ArrayUtils.insert  "-1"          "myArray" "test"       # ("a" "foo bar" "b" "c" "d" "") - failure
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When all elements are inserted.
# @exitcode 1 When the index is not a positive number or reference is not an array or there are no value to insert.
#/
ArrayUtils.insert() {
  Log.in $LINENO "$@"
  [ $# -lt 3 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }

  local inIndex="$1"
  local ref_ArrayUtilsInsert_ioArrayName="$2"
  ArrayUtils.isArray "$ref_ArrayUtilsInsert_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.isArrayIndex "$inIndex"                     || { Log.ex $LINENO; return "$APASH_FAILURE"; }  
  shift 2
  local inValues=("$@")
  local i j

  if [ "$APASH_SHELL" = "zsh" ]; then
    local ref_ArrayUtilsInsert_outArray=()
    ref_ArrayUtilsInsert_outArray=("${${(P)ref_ArrayUtilsInsert_ioArrayName}[@]:0:$((inIndex-APASH_ARRAY_FIRST_INDEX))}" \
                                   "${inValues[@]}" \
                                   "${${(P)ref_ArrayUtilsInsert_ioArrayName}[@]:$((inIndex-APASH_ARRAY_FIRST_INDEX))}")
    ArrayUtils.clone "ref_ArrayUtilsInsert_outArray" "$ref_ArrayUtilsInsert_ioArrayName" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
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
    ArrayUtils.clone "ref_ArrayUtilsInsert_outArray" "$ref_ArrayUtilsInsert_ioArrayName" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  fi

  Log.out $LINENO; return "$APASH_FAILURE"
}
