#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.NumberUtils.isDigits

# File description ###########################################################
# @name ArrayUtils.insert
# @brief Inserts elements into an array at the given index (starting from zero).
#
# @description
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
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
#
# @arg $1 number Positive index of the array to insert values.
# @arg $2 ref(string[]) Name of the array to modify.
# @arg $3 string... Values to insert at the indicated index.
#
# @stdout None
# @stderr None.
#
# @exitcode 0 When all elements are inserted.
# @exitcode 1 When the index is not a positive number or reference is not an array or there are no value to insert.
ArrayUtils.insert() {
  local inIndex="$1"
  local ioArrayRef="$2"
  local -n ioArray="$ioArrayRef" 2> /dev/null || return "$APASH_FUNCTION_FAILURE"    
  ArrayUtils.isArray "$ioArrayRef" || return "$APASH_FUNCTION_FAILURE"
  NumberUtils.isDigits "$inIndex" || return "$APASH_FUNCTION_FAILURE"

  shift 2  
  [ $# -eq 0 ] && return "$APASH_FUNCTION_FAILURE"
  inValues=("$@") ||  return "$APASH_FUNCTION_FAILURE"

  ioArray=("${ioArray[@]:0:inIndex}" "${inValues[@]}" "${ioArray[@]:inIndex}") && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
