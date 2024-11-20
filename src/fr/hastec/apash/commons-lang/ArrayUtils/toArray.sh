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
# | $1     | apash_ioArrayName    | ref(string[]) | out      |                 | Name of the array to toArray.        |
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
  Log.in $LINENO "$@"
  [ $# -lt 1 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
  local apash_ioArrayName="${1:-}" 
  local -a apash_outArray=()
  shift

  # shellcheck disable=SC2034
  apash_outArray=("$@")

  ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
