#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.sh
apash.import fr.hastec.apash.commons-lang.StringUtils.indexOf
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

##/
# @name StringUtils.indexOfAny
# @brief Search a string to find the first index of any character in the given set of characters.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inString       | string        | in       |            | The string to check.                  |
#
# ### Example
# ```bash
#                        StringUtils.indexOfAny ""                 # -1
#    arr=("")          ; StringUtils.indexOfAny ""           arr   #  0
#    arr=("a")         ; StringUtils.indexOfAny ""           arr   # -1
#    arr=("cd" "ab" )  ; StringUtils.indexOfAny "zzabyycdxx" arr   #  2
#    arr=("zab" "aby") ; StringUtils.indexOfAny "zzabyycdxx" arr   #  1
# ```
#
# @stdout The first minimum index matching researches, -1 if no match
#         or empty input string or empty research.
# @stderr None.
#
# @exitcode 0 If the index can be displayed.
# @exitcode 1 Otherwise.
#
# Note for passing array by reference
# @see [indexOf](indexOf.md)
# @see https://stackoverflow.com/questions/10953833/passing-multiple-distinct-arrays-to-a-shell-function
#/
StringUtils.indexOfAny() {
  Log.in $LINENO "$@"
  local inString="${1:-}"
  local researchName="${2:-}"
  local index="$ArrayUtils_INDEX_NOT_FOUND"
  local i r
  local -a researh=()
  
  # If the array cannot be clone (because it's not an array)
  # Then return index not found.
  if ! ArrayUtils.clone "$researchName" "research"; then
    echo "$ArrayUtils_INDEX_NOT_FOUND" && return "$APASH_SUCCESS"
    return "$APASH_FAILURE"
  fi

  # If the researsh is empty then return -1.
  if [[ ${#research[@]} -eq 0 ]]; then
    echo "$ArrayUtils_INDEX_NOT_FOUND" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  # For each reseach, apply the function indexOf
  # and keep the minimum index if string has been found.
  for r in "${research[@]}"; do
    i=$(StringUtils.indexOf "$inString" "$r") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    [[ $i -ge 0  && ($index -eq $ArrayUtils_INDEX_NOT_FOUND || $i -lt $index) ]] && index=$i
  done

  echo "$index" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
