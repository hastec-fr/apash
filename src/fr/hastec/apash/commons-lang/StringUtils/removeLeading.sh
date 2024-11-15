#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.remove
# @brief Removes all occurrences of a substring from within the source string.
# @description 
#   An empty ("") source string will return the empty string.
#   An empty ("") remove string will return the source string.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inString       | string        | in       |            | The string to modify.                 |
# | $2     | inSubstring    | string        | in       |            | The substring to remove within the input string. |
#
# #### Example
# ```bash
#    StringUtils.remove ""                   ""       # ""
#    StringUtils.remove ""                   ":"      # ""
#    StringUtils.remove "queued"             ""       # "queued"
#    StringUtils.remove "queued"             "ue"     # "qd"
#    StringUtils.remove "abab::cd:ab:ef::ab" "ab"     # "::cd::ef::"
#    StringUtils.remove "queued"             "zz"     # "queued"
# ```
#
# @stdout The substring with the string removed if found.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 otherwise.
#/
StringUtils.remove() {
  Log.entry "$LINENO" "$@"
  local inString="$1"
  local inSubstring="$2"

  echo "${inString//"$inSubstring"/}" && return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}
