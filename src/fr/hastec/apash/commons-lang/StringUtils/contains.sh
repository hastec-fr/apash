#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.contains
# @brief Checks if the CharSequence contains certain characters.
# @description 
#   An empty sequence of character to search returns always true.
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
# | $1     | inString       | string        | in       |            | The string to check.                  |
# | $2     | inSequence     | string        | in       |            | The sequence of characters to search. |
#
# ### Example
# ```bash
#    StringUtils.constainsOnly ""      ""      # true
#    StringUtils.constainsOnly ""      "ab"    # false
#    StringUtils.constainsOnly "abc"   ""      # true
#    StringUtils.constainsOnly "abc"   "abc"   # true
#    StringUtils.constainsOnly "ab"    "abc"   # false
#    StringUtils.constainsOnly "ab1"   "abc"   # false
#    StringUtils.constainsOnly "abcde" "bcd"   # true
#    StringUtils.constainsOnly "abcde" "a*bc"  # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 True if the input string contains only provided characters.
# @exitcode 1 Otherwise.
#/
StringUtils.contains(){
  Log.in $LINENO "$@"
  local inString="${1:-}"
  local inSequence="${2:-}"

  # Returns true if the string to search is empty.
  [[ -z $inSequence ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  # Fail when input string is not empty but sequence is.
  [[ -n $inString && -z $inSequence ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }

  # Check that string contains the sequence of characters.
  [[ $inString == *"$inSequence"* ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  Log.out $LINENO; return "$APASH_FAILURE"
}
