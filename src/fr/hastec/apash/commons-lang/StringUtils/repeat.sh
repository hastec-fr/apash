#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.NumberUtils.isLongPositive
apash.import fr.hastec.apash.commons-lang.VersionUtils.isLowerOrEquals

##/
# @name StringUtils.repeat
# @brief repeats a string.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inNumber       | number        | in       |            | The number of time string is repeated.|
# | $2     | inString       | string        | in       |            | The string to repeat.                 |
#
# ### Example
# ```bash
#    StringUtils.repeat 3 "a"       # "aaa"
#    StringUtils.repeat 2 "ab"      # "abab"
# ```
#
# @stdout The repeated string.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
#/
StringUtils.repeat() {
  Log.in $LINENO "$@"
  local inNumber="${1:-}"
  local inString="${2:-}"
  local -i i
  
  NumberUtils.isLongPositive "$inNumber" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  if [[ $APASH_SHELL == "zsh" ]] && \
      VersionUtils.isLowerOrEquals "$APASH_SHELL_VERSION" "5.2"; then
    local outString=""
    for (( i=0; i < inNumber; i++ )); do
      outString+="$inString"
    done
    echo "$outString" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  else
    printf "%0.s$inString" $(seq 1 "$inNumber") && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  fi
  Log.out $LINENO; return "$APASH_FAILURE"
}
