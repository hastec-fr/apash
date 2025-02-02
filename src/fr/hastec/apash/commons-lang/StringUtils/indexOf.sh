#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.indexOf
# @brief Finds the first index of a substring occurence within another string.
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
# | $2     | inResearch     | string        | in       |            | The substring to find within the input string. |
#
# ### Example
# ```bash
#    StringUtils.indexOf ""         ""   #  0
#    StringUtils.indexOf "aabaabaa" ""   #  0
#    StringUtils.indexOf "aabaabaa" "b"  #  2
#    StringUtils.indexOf "aabaabaa" "ab" #  1
#    StringUtils.indexOf "aabaabaa" "mn" # -1
# ```
#
# @stdout The first index of the search, -1 if no match.
# @stderr None.
#
# @exitcode 0 If the index can be displayed.
# @exitcode 1 Otherwise.
#/
StringUtils.indexOf() {
  Log.in $LINENO "$@"
  local inString="${1:-}"
  local inResearch="${2:-}"
  local index=-1

  # Case when string is empty but not the inResearch
  if [[ -z "$inString" &&  -n "$inResearch" ]]; then
    echo "$index" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  # Case when researh is empty but not the input string
  if [[ -n "$inString" &&  -z "$inResearch" ]]; then
    echo "0" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  # Case when both are empty
  if [[ -z "$inString" &&  -z "$inResearch" ]]; then
    echo "0" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi  

  # Find character index in string (preffered to expr: SC2308)
  # If the number of characters remains the same, it means that no 
  # occurence has been found.
  index=${inString%%"${inResearch}"*}
  [ ${#index} -eq ${#inString} ] && index=-1 || index=$((${#index}))

  echo "$index" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
