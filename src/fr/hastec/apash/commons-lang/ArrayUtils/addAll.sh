#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex
[ "$APASH_SHELL" = "zsh" ] && apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.addAll
# @brief Adds given elements at the end of an array.
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
# | #      | varName           | Type          | in/out   | Default    | Description                           |
# |--------|-------------------|---------------|----------|------------|---------------------------------------|
# | $1     | apash_ioArrayName | ref(string[]) | in & out |            | Name of the array to modify.          |
# | ${@:2} | $@                | string...     | in       |            | Values to add at the end of the array.|
#
# ### Example
# ```bash
#    ArrayUtils.addAll  "myArray"              # ()
#    ArrayUtils.addAll  "myArray"  "a"         # ("a")
#    ArrayUtils.addAll  "myArray"  "b" ""      # ("a" "b" "")
#    ArrayUtils.addAll  "myArray"  "c" "d"     # ("a" "b" "" "c" "d")
#    ArrayUtils.addAll  "myArray"  "foo bar"   # ("a" "b" "" "c" "d" "foo bar")
#
#    myArray=("a" "b")
#    myArray[APASH_ARRAY_FIRST_INDEX+3]="x"
#    ArrayUtils.addAll  "myArray" "foo bar" "z"   # ("a" "b" "" "x" "foo bar" "z")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When first argument is an array and at least one value is provided.
# @exitcode 1 Otherwise.
#
# @see
#  * [ArrayUtil.insert](./insert.md): Adding multiple element in the middle of an array.
#  * [ArrayUtil.add](./add.md): Adding a single elements at the end of an array.
#  * [ArrayUtil.addFirst](./addFirst.md): Adding an element at the beginning of an array.
#/
ArrayUtils.addAll() {
  Log.in $LINENO "$@"
  local apash_ioArrayName="${1:-}"

  # @todo: Create functions addOne and addMany to force at least one entry.
  # Create the array if it does not exists and succeed if no value should be added.
  ArrayUtils.nullToEmpty "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  # If no value to add, then return immediatly.
  shift
  [ $# -eq 0 ] && return "$APASH_SUCCESS"

  # Get the array in local scope.
  if [ "$APASH_SHELL" = "zsh" ]; then
    local -a apash_outArray=()
    ArrayUtils.clone "$apash_ioArrayName" "apash_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  else # bash
    local -n apash_outArray="$apash_ioArrayName"
  fi
  
  # @todo: Find a way to determine if added value are not out of bound of indexes (insert, add* methods).
  # Add values at the end of the array
  apash_outArray+=("$@")                                   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  if [ "$APASH_SHELL" = "zsh" ]; then
    ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  fi

  Log.out $LINENO; return "$APASH_SUCCESS"
}
