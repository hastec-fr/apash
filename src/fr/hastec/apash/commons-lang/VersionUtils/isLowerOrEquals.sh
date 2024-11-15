#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.VersionUtils.compare

##/
# @name VersionUtils.isLower
# @brief Compare two versions and determine if the first one is lower than the second one
# @description
#   Please not that for a real comparison, both 
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
# | $1     | inString       | string        | in       |            | The first version to check            |
# | $2     | inString       | string        | in       |            | The second version to check           |
#
# ### Example
# ```bash
#    VersionUtils.isLower "1.2.0"          "1.2.0"         # true
#    VersionUtils.isLower "1.2.1"          "1.10.0"        # true
#    VersionUtils.isLower "1.2.0-alpha2"   "1.2.0-alpha10" # true
#    VersionUtils.isLower "1.2.0-alpha2"   "1.2.0-beta1"   # true
#    VersionUtils.isLower "1.10.1"         "1.2.0"         # false
#    VersionUtils.isLower "1.2.0-alpha10"  "1.2.0-alpha2"  # false
#    VersionUtils.isLower "1.2.0-final"    "1.2.0-alpha2"  # false
#    VersionUtils.isLower "1.2.0"          "1.2.0-alpha2"  # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 If the first version is less or equals than the second one.
# @exitcode 1 Otherwise.
VersionUtils.isLowerOrEquals() {
  Log.entry "$LINENO" "$@"
  local version1="$1"
  local version2="$2"
  local comp
  
  # Errors are considered as if the version is greater.
  comp=$(VersionUtils.compare "$version1" "$version2")
  [[ "$comp" == "-1" || "$comp" == "0" ]] && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
