#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.StringUtils.indexOf
apash.import fr.hastec.apash.commons-lang.StringUtils.reverse

##/
# @name StringUtils.lastIndexOf
# @brief Finds the last index of a substring occurence within another string.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                                    |
# |--------|----------------|---------------|----------|------------|------------------------------------------------|
# | $1     | inString       | string        | in       |            | The string to check.                           |
# | $2     | inResearch     | string        | in       |            | The substring to find within the input string. |
#
# ### Example
# ```bash
#    StringUtils.lastIndexOf ""         ""   #  0
#    StringUtils.lastIndexOf "aabaabaa" ""   #  8
#    StringUtils.lastIndexOf "aabaabaa" "b"  #  5
#    StringUtils.lastIndexOf "aabaabaa" "ab" #  4
#    StringUtils.lastIndexOf "aabaabaa" "mn" # -1
# ```
#
# @stdout The last index of the search, -1 if no match.
# @stderr None.
#
# @exitcode 0 If the index can be displayed.
# @exitcode 1 Otherwise.
#/
StringUtils.lastIndexOf() {
  Log.in $LINENO "$@"
  local inString="${1:-}"
  local inResearch="${2:-}"
  inString="$(StringUtils.reverse "$inString")" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  inResearch="$(StringUtils.reverse "$inResearch")" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  local index
  index="$(StringUtils.indexOf "$inString" "$inResearch")"
  if [ "$index" -eq -1 ]; then
    echo "-1" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  echo $((${#inString} - index - ${#inResearch})) || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
