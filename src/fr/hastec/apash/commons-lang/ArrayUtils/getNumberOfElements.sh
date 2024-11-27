#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

##/
# @name ArrayUtils.getNumberOfElements
# @brief Returns the number of elements in the arrays.
# @description
#   This number correspond to the lenght in zsh and could be different in bash.
#   due to the discontinued indexes.
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
# | $1     | apash_inArrayName  | ref(string[]) | in       |            | Name of the array to get length.     |
#
# ### Example
# ```bash
#    myArray=("a" "b" "" "c")
#    ArrayUtils.getNumberOfElements  "myArray"      # 4
#
#    myArray[10]=z
#    ArrayUtils.getNumberOfElements  "myArray"      # bash: 5, zsh: 10
#
#    myArray=()
#    ArrayUtils.getNumberOfElements  "myArray"      # 0
# ```
#
# @stdout The number of element, or empty if it's not an array or does not exists.
# @stderr None.
#
# @exitcode 0 When input array reference exists.
# @exitcode 1 Otherwise.
#
# @see 
# * [ArrayUtils.getLastIndex](./getLastIndex.md)
# * [ArrayUtils.getLength](./getLength.md)
#/
ArrayUtils.getNumberOfElements() {
  Log.in $LINENO "$@"
  local apash_inArrayName="${1:-}"
  
  ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  if [ "$APASH_SHELL" = "zsh" ]; then
    echo "${#${(PA)apash_inArrayName}[@]}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  else # bash
    local -n apash_inArray="$apash_inArrayName"
    echo "${#apash_inArray[@]}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  fi

  Log.out $LINENO; return "$APASH_FAILURE"
}
