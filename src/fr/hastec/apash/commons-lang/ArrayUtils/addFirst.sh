#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.addFirst
# @brief Adds given elements at the beginning of an array.
# @description
#   The array is automatically created if the variable is not declared.
#   Existing variables or maps are not overriden and the function fails.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ### ChangeLogs:
#  * 0.2.0 (hastec-fr):  Consider no argument as success (nothing added).
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName           | Type          | in/out   | Default    | Description                          |
# |--------|-------------------|---------------|----------|------------|--------------------------------------|
# | $1     | apash_ioArrayName | ref(string[]) | in & out |            | Name of the array to modify.         |
# | $2     | apash_inValue     | string...     | in       |            | Value to add at the beginning of the array.|
#
# ### Example
# ```bash
#    ArrayUtils.addFirst  "myArray"              # ()
#    ArrayUtils.addFirst  "myArray"  "a"         # ("a")
#    ArrayUtils.addFirst  "myArray"  "b"         # ("b" "a")
#    ArrayUtils.addFirst  "myArray"  ""          # ("" "a" "b")
#    ArrayUtils.addFirst  "myArray"  "c" "d"     # failure
#    ArrayUtils.addFirst  "myArray"  "foo bar"   # ("foo bar" "" "b" "a")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When first argument is an array and a value must be added.
# @exitcode 1 When none or more than 1 value must be added.
#
# @see
#  * [ArrayUtil.insert](./insert.md): Adding multiple element in the middle of an array.
#  * [ArrayUtil.add](./add.md): Adding a single elements at the end of an array.
#  * [ArrayUtil.addAll](./addAll.md): Adding multiple elements at the end of an array.
#/
ArrayUtils.addFirst() {
  Log.in $LINENO "$@"
  local apash_ioArrayName="$1"
  local apash_inValue="$2"
  # Prepare output array with expected value at the first position.
  local apash_outArray=("$apash_inValue")
  local apash_inArray=()
  local i

  # Return imediatly if more than one value should be added.
  [ $# -gt 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # Create the array if it does not exists and fails if too many values should be added.
  ArrayUtils.nullToEmpty "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  [ $# -lt 2 ] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  
  ArrayUtils.clone "$apash_ioArrayName" "apash_inArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # Add the current array values to the output array.
  if [ "$APASH_SHELL" = "zsh" ]; then
    apash_outArray+=("${apash_inArray[@]}")
  else
    # Need to preserve indexes in bash (+1)
    for i in "${!apash_inArray[@]}"; do
      apash_outArray[i+1]="${apash_inArray[i]}"
    done
  fi

  ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
