#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
[ "$APASH_SHELL" = "bash" ] && apash.import fr.hastec.apash.commons-lang.VersionUtils.isLowerOrEquals

##/
# @name StringUtils.upperCase
# @brief Converts a String to upper case.
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
# | $1     | inString       | string        | in       |            | The string to upper case.             |
#
# ### Example
# ```bash
#    StringUtils.upperCase ""              # ""
#    StringUtils.upperCase "abc"           # "ABC"
#    StringUtils.upperCase "aBc"           # "ABC"
#    StringUtils.upperCase "a123b"         # "A123B"
#    StringUtils.upperCase "ABC"           # "ABC"
#    StringUtils.upperCase "crème brûlée"  # "CRÈME BRÛLÉE"
# ```
#
# @stdout The upper cased string
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
#/
StringUtils.upperCase() {
  Log.entry "$LINENO" "$@"
  local inString="$1"

  if [ "$APASH_SHELL" = "zsh" ]; then
    echo "${(U)inString}" && return "$APASH_FUNCTION_SUCCESS"
  elif [ "$APASH_SHELL" = "bash" ] && \
       ! VersionUtils.isLowerOrEquals "$APASH_SHELL_VERSION" "4.2"; then
    echo "${inString^^}" && return "$APASH_FUNCTION_SUCCESS"
  else # More POSIX
    echo "$inString" | awk '{print toupper($0)}' && return "$APASH_FUNCTION_SUCCESS"
  fi

  return "$APASH_FUNCTION_FAILURE"
}
