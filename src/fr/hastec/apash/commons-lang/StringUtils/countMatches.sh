#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.countMatches
# @brief Counts how many times the substring appears in the larger string.
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
# | $2     | inSubstring    | string        | in       |            | The substring to count.               |
#
# ### Example
# ```bash
#    StringUtils.countMatches ""     ""      # 0
#    StringUtils.countMatches ""     "a"     # 0
#    StringUtils.countMatches "abba"  ""     # 0
#    StringUtils.countMatches "abba"  "a"    # 2
#    StringUtils.countMatches "abba"  "ab"   # 1
#    StringUtils.countMatches "abba"  "xxx"  # 0
# ```
#
# @stdout The number of occurrences, 0 if either string is empty
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
#/
StringUtils.countMatches() {
  Log.in $LINENO "$@"
  local inString="$1"
  local inSubstring="$2"
  local -i count=0

  if [[ -z $inString || -z $inSubstring ]]; then
    echo "$count" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  count=$(echo "$inString" | grep -o "$inSubstring" | wc -l)
  echo "$count" || { Log.out $LINENO; return "$APASH_FAILURE"; }

  Log.out $LINENO; return "$APASH_SUCCESS"
}
