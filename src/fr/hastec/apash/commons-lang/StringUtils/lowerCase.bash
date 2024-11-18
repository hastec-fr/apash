#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.VersionUtils.isLowerOrEquals

##/
# @name StringUtils.lowerCase
# @brief Converts a String to lower case.
# @description
#   Demo of the way to include different versions of the method in multiple files.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ### Reference:
# For complete documentation, please refer to lowerCase.sh.
#/
StringUtils.lowerCase() {
  Log.in $LINENO "$@"
  local inString="$1"
  echo "${inString,,}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
