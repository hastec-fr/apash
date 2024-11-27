#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.replace
# @brief Replaces all occurrences of a String within another String.
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
# | $1     | inString       | string        | in       |            | The string to modify.                 |
# | $2     | inSubstring    | string        | in       |            | The substring to search.              |
# | $3     | inReplacement  | string        | in       |            | The string which replaces the substring found. |
#
# ### Example
# ```bash
#    StringUtils.replace ""     ""    ""   # ""
#    StringUtils.replace ""     "a"   "d"  # ""
#    StringUtils.replace "any"  ""    "d"  # "any"
#    StringUtils.replace "any"  "a"   "de" # "deny"
#    StringUtils.replace "aba"  "a"   ""   # "b"
#    StringUtils.replace "aba"  "a"   "z"  # "zbz"
#    StringUtils.replace "aba"  "z"   "x"  # "aba"
# ```
#
# @stdout The text with any replacements processed
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 otherwise.
#/
StringUtils.replace() {
  Log.in $LINENO "$@"
  local inString="${1:-}"
  local inSubstring="${2:-}"
  local inReplacement="${3:-}"

  [ -z "$inSubstring" ] && echo "${inString}"         && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  echo "${inString//"$inSubstring"/"$inReplacement"}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }

  Log.out $LINENO; return "$APASH_FAILURE"
}
