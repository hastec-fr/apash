#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.equals
# @brief Compares two string, returning true if they represent equal sequences of characters.
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
# | $1     | inString1      | string        | in       |            | First string to compare.              |
# | $2     | inString2      | string        | in       |            | Second string to compare.             |
#
# ### Example
# ```bash
#    StringUtils.equals "" ""        # true
#    StringUtils.equals "abc" "abc"  # true
#    StringUtils.equals "abc" "abcd" # false
# ```
#
# @stdout None.
# @stderr None
#
# @exitcode 0 If the string are equal (case-sensitive), or both empty.
# @exitcode 1 Otherwise.
#/
StringUtils.equals() {
  Log.in $LINENO "$@"
  [[ "${1:-}" == "${2:-}" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  { Log.out $LINENO; return "$APASH_FAILURE"; }
}
