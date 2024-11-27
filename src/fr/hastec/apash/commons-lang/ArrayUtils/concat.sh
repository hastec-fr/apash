#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex

##/
# @name ArrayUtils.concat
# @brief Concatenate multiple arrays.
# @description
#   The final output array can be one of the input arrays.
# 
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName            | Type          | in/out   | Default    | Description                          |
# |--------|--------------------|---------------|----------|------------|--------------------------------------|
# | $1     | apash_outArrayName | ref(string[]) | out      |            | Name of the array with concatenated arrays. |
# | ${@:2} | $@                 | ref(string[]) | in       |            | Name of the arrays to concatenate.          |
#
# ### Example
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
#/
ArrayUtils.concat() {
  Log.in $LINENO "$@"
  local apash_outArrayName="${1:-}"
  local apash_arrayName
  local -a apash_outArray=()
  local -i apash_i apash_counter=0

  # If no array passed, then fails.
  [ $# -lt 1 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  shift

  # Fails if one of the argument does not refer to an array.
  for apash_arrayName in "$@"; do
    ArrayUtils.isArray "$apash_arrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  done

  # Initialize the output array.
  ArrayUtils.nullToEmpty "$apash_outArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # For each array, concatenate the content to the output array
  for apash_arrayName in "$@"; do
    if [ "$APASH_SHELL" = "zsh" ]; then
      # In zsh, no discontinued index so it allows to execute a direct concatenation.
      [[ ${#${(P)apash_arrayName[@]}} == 1 && ${${(P)apash_arrayName}[@]} == "" ]] \
         && apash_outArray+=("") \
         || apash_outArray+=("${${(P)apash_arrayName}[@]}")
    else
      local -n apash_inArray="$apash_arrayName"
      
      # If no element in the array, then get the next array.
      [[ ${#apash_inArray[@]} -eq 0 ]] && continue

      # Loop on potential discontinued indexes
      for apash_i in "${!apash_inArray[@]}"; do
        apash_outArray[apash_counter+apash_i]="${apash_inArray[apash_i]}"
      done

      # Recalculate the offset of the output array.
      apash_counter=$(ArrayUtils.getLastIndex "apash_outArray") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
      ((apash_counter++))
    fi
  done

  # Push the result to the desired array.
  ArrayUtils.clone "apash_outArray" "$apash_outArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
