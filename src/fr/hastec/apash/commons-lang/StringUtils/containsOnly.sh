#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.containsOnly
# @brief Checks if the CharSequence contains only certain characters.
# @description 
#   Checks if the CharSequence contains only certain characters.
#   An empty input string returns always true.
#   An empty sequence of character to search with a non empty input 
#   string returns false.
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
# | $2     | inSequence     | string        | in       |            | The sequence of characters which should compose the input string. |
#
# ### Example
# ```bash
#    StringUtils.constainsOnly ""     ""     # true
#    StringUtils.constainsOnly ""     "ab"   # true
#    StringUtils.constainsOnly "ab"   ""     # false
#    StringUtils.constainsOnly "abab" "abc"  # true
#    StringUtils.constainsOnly "ab1"  "abc"  # false
#    StringUtils.constainsOnly "abz"  "abc"  # false
# ```
#
# @stdout None.
# @stderr None
#
# @exitcode 0 True if the input string contains only provided characters.
# @exitcode 1 Otherwise.
#/
StringUtils.containsOnly(){
  Log.in $LINENO "$@"
  local inString=$1
  local inSequence=$2

  # Returns true if input string is empty.
  [[ -z $inString ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  # Fail when input string is not empty but sequence is.
  [[ -n $inString && -z $inSequence ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }

  # Check by regexp that string is composed only by chars in the sequence.
  [[ $inString =~ ^[$inSequence]*$ ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  Log.out $LINENO; return "$APASH_FAILURE"
}
