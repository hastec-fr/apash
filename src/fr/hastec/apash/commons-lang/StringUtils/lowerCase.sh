#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.lowerCase
# @brief Converts a String to lower case.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ### ChangeLogs:
# - 0.2.0: Split file to .bash, .zsh and bash_4.2.53. Let the nearest POSIX code in .sh.
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inString       | string        | in       |            | The string to lower case.             |
#
# #### Example
# ```bash
#    StringUtils.upperCase ""              # ""
#    StringUtils.upperCase "ABC"           # "abc"
#    StringUtils.upperCase "AbC"           # "abc"
#    StringUtils.upperCase "A123B"         # "a123b"
#    StringUtils.upperCase "abc"           # "abc"
#    StringUtils.upperCase "CRÈME BRÛLÉE"  # "crème brûlée"
# ```
#
# @stdout The lower cased string
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
#/
StringUtils.lowerCase() {
  Log.entry "$LINENO" "$@"
  local inString="$1"
  echo "$inString" | awk '{print tolower($0)}' && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
