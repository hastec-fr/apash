#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
[ "$APASH_SHELL" = "zsh" ] && apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.add
# @brief Adds a given element at the end of an array.
# @description
#   The array is automatically created if the variable is not declared.
#   Existing variables or maps are not overriden and the function fails.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ### ChangeLogs:
#  * 0.2.0 (hastec-fr):
#    * Fix issue with discontinued indexes in bash.
#    * Consider no argument as success (nothing added).
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #  | varName           | Type          | in/out   | Default    | Description                          |
# |----|-------------------|---------------|----------|------------|--------------------------------------|
# | $1 | apash_ioArrayName | ref(string[]) | in & out |            | Name of the array to modify.         |
# | $2 | apash_inValue     | string        | in       |            | Value to add at the end of the array.|
#
# ### Example
# ```bash
#    ArrayUtils.add  "myArray"              # ()
#    ArrayUtils.add  "myArray"  "a"         # ("a")
#    ArrayUtils.add  "myArray"  "b"         # ("a" "b")
#    ArrayUtils.add  "myArray"  ""          # ("a" "b" "")
#    ArrayUtils.add  "myArray"  "foo bar"   # ("a" "b" "" "foo bar")
#    ArrayUtils.add  "myArray"  "c" "d"     # failure
#    
#    myArray[APASH_ARRAY_FIRST_INDEX+5]="x"
#    ArrayUtils.add  "myArray"  "z"         # ("a" "b" "" "foo bar" "" "x" "z")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When first argument is an array.
# @exitcode 1 Otherwise.
#
# @see
#  * [ArrayUtil.insert](./insert.md): Adding multiple element in the middle of an array.
#  * [ArrayUtil.addAll](./addAll.md): Adding multiple elements at the end of an array.
#  * [ArrayUtil.addFirst](./addFirst.md): Adding an element at the beginning of an array.
#/
ArrayUtils.add() {
  Log.in $LINENO "$@"
  local apash_ioArrayName="$1"
  local apash_inValue="$2"  

  # Return if more than 1 value should be added.
  [ $# -gt 2 ] && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  # Create the array if it does not exists and succeed if no value should be added.
  ArrayUtils.nullToEmpty "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  [ $# -lt 2 ] && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  # Add the value.
  if [ "$APASH_SHELL" = "zsh" ]; then
    local apash_outArray=()
    ArrayUtils.clone "$apash_ioArrayName" "apash_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    apash_outArray+=("$apash_inValue")                     || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  else
    local -n apash_inArray="$apash_ioArrayName"
    apash_inArray+=("$apash_inValue") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  fi
  
  Log.out $LINENO; return "$APASH_SUCCESS"
}
