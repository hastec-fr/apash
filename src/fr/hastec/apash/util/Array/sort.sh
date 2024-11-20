#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
apash.import fr.hastec.apash.commons-lang.VersionUtils.isLowerOrEquals
apash.import fr.hastec.apash.util.Array.bubbleSort
[ "$APASH_SHELL" = "zsh" ] && apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name Array.sort
# @brief Sorts the specified array into ascending natural order.
# @description
#   Non array reference will be transformed to empty array.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | apash_inArrayName    | ref(string[]) | in & out |            | The array to sort.                    |
#
# ### Example
# ```bash
#    myArray=("a" "b" "c")
#    Array.sort "myArray"  # ("a" "b" "c")
#
#    myArray=("a" "c" "b")
#    Array.sort "myArray"  # ("a" "b" "c")
#
#    myArray=("beta-20" "beta-10" "beta-1")
#    Array.sort "myArray"  # ("beta-1" "beta-10" "beta-20")
#
#    myArray=("1" "a" "2" "3")
#    Array.sort "myArray"  # ("1" "2" "3" "a")
#   
#    myArray=("1" "")
#    Array.sort "myArray"  # ("" "1")
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 True Whether the array is sorted according to natural ordering.
# @exitcode 1 Otherwise.
#/
Array.sort() {
  Log.in $LINENO "$@"
  local apash_inArrayName="${1:-}"
  ArrayUtils.nullToEmpty "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  if [ "$APASH_SHELL" = "zsh" ]; then
    local apash_inArray=("${(o)${(P)apash_inArrayName}[@]}")
    ArrayUtils.clone "apash_inArray" "$apash_inArrayName" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  else # bash
    local -n inArray="$apash_inArrayName"
    [[ ${#inArray[@]} -eq 0 ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    if VersionUtils.isLowerOrEquals "$APASH_SHELL_VERSION" "4.3"; then
      Array.bubbleSort "$apash_inArrayName" &&  { Log.out $LINENO; return "$APASH_SUCCESS"; }
    else
      readarray -d '' inArray < <(printf "%s\0" "${inArray[@]}" | sort -z) && { Log.out $LINENO; return "$APASH_SUCCESS"; }
    fi
  fi

  Log.out $LINENO; return "$APASH_FAILURE"
}
