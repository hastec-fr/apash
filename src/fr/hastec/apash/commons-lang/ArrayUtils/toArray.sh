#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name ArrayUtils.toArray
# @brief Create an array based on list of arguments.
# @description
#   The toArray is stopped at the end of the array and as many as possible elements are toArrayed.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default         | Description                          |
# |--------|----------------|---------------|----------|-----------------|--------------------------------------|
# | $1     | ioArrayName    | ref(string[]) | out      |                 | Name of the array to toArray.        |
# | ${@:2} | inValues       | string...     | in       |                 | Elements to add to the array.        |
#
# ### Example
# ```bash
#    myArray=()
#    ArrayUtils.toArray    "myArray"                   # ()
#    ArrayUtils.toArray    "myArray"  "2"              # (2)
#    ArrayUtils.toArray    "myArray"  "a" "b" "c" "d"  # ("a" "b" "c" "d")
#    ArrayUtils.toArray    "myArray"  "a" "2" "b"      # ("a" "2" "b")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When list of argument are pushed to the array.
# @exitcode 1 When the input is not an array.
#/
ArrayUtils.toArray() {
  Log.entry "$LINENO" "$@"
  [ $# -lt 1 ] && return "$APASH_FUNCTION_FAILURE"
  local ioArrayName="$1" 
  shift

  local outArray=()
  # shellcheck disable=SC2034
  outArray=("$@")

  ArrayUtils.clone "outArray" "$ioArrayName" ||  return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}
