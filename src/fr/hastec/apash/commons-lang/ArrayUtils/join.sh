#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLength

##/
# @name ArrayUtils.join
# @brief Return all elements of an array joined by an input string.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Example
# ```bash
#    myArray=("a" "b" "" "c")
#    ArrayUtils.join  "myArray"              # "a b  c"
#    ArrayUtils.join  "myArray"  ","         # "a,b,,c"
#    ArrayUtils.join  "myArray"  "|1|"       # "a|1|b|1||1|c"
#    
#    myArray[6]="z"
#    ArrayUtils.join  "myArray"  ","         # "a,b,,c,,z"
# ```
#
# @arg $1 ref(string[]) Name of the array to get values.
# @arg $2 string The delimiter which join values. (Default=" ")
#
# @stdout A single string having all values of the array joined by the chosen delimiter.
# @stderr None.
#
# @exitcode 0 When first argument is an array.
# @exitcode 1 Otherwise.
#/
ArrayUtils.join() {
  Log.in $LINENO "$@"
  local apash_inArrayName="$1"
  local apash_inDelimiter="${2:- }"
  local -i apash_i
  local apash_outString=""
  local apash_arrayLength

  apash_arrayLength=$(ArrayUtils.getLength "$apash_inArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  if [ "$APASH_SHELL" = "zsh" ]; then
    apash_outString="${${(P)apash_inArrayName}[APASH_ARRAY_FIRST_INDEX]}"
    for (( apash_i=APASH_ARRAY_FIRST_INDEX+1; apash_i < APASH_ARRAY_FIRST_INDEX + apash_arrayLength; apash_i++ )); do
      apash_outString+="${apash_inDelimiter}${${(P)apash_inArrayName}[apash_i]}"
    done
  else # bash
    local -n apash_inArray="$apash_inArrayName"
    apash_outString="${apash_inArray[0]}"
    # Trick with IFS does not accept delimiter with multiple chars.
    for (( apash_i=APASH_ARRAY_FIRST_INDEX+1; apash_i < APASH_ARRAY_FIRST_INDEX + apash_arrayLength; apash_i++ )); do
      apash_outString+="${apash_inDelimiter}${apash_inArray[apash_i]}"
    done
  fi

  echo "$apash_outString" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}