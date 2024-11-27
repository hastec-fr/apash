#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.endsWith
# @brief Check if a string ends with a specified suffix.
# @description
#   The suffix is a string (not a pattern).
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
# | $1     | inString       | string        | in       |            | Input string to check.                |
# | $2     | inSuffix       | string        | in       |            | The suffix to find.                   |
#
# ### Example
# ```bash
#    StringUtils.endsWith "" ""             # true
#    StringUtils.endsWith "abcd"     ""     # true
#    StringUtils.endsWith "abcd"     "cd"   # true
#    StringUtils.endsWith "abcd"     "bd"   # false
#    StringUtils.endsWith ""         "c"    # false
#    StringUtils.endsWith "apash"    ".sh"  # false
#    StringUtils.endsWith "apash.sh" ".sh"  # false
# ```
#
# #### Implementation notes
#   In zsh, pattern chararecters are interpreted even if they are between quotes.
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 If the string ends with the suffix.
# @exitcode 1 Otherwise.
#/
StringUtils.endsWith(){
  Log.in $LINENO "$@"
  local inString="${1:-}"
  local inSuffix="${2:-}"

  if [ "$APASH_SHELL" = "zsh" ]; then
    [[ -z "$inSuffix" || "${inString: -${#inSuffix}}" = "$inSuffix" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  else # bash
    # The string is between quotes to prevent the interpretation of pattern symbols in bash.
    # @todo: endsWithPattern
    [[ "$inString" =~ "${inSuffix}"$ ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  fi
  { Log.out $LINENO; return "$APASH_FAILURE"; }
}
