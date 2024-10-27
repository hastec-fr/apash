#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.MapUtils.clone

# File description ###########################################################
# @name VersionUtils.isLower
# @brief Parse the input version and create an associative array containing each element
# @description
#   Based on semver scheme
#
# ### Since:
# 0.2.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inMapName      | ref(string{}) | out      |            | Output map of the version             |
# | $2     | inVersion      | string        | in       |            | Representative string of the version  |
#
# @example
#    VersionUtils.parse myMap  "1.2.0"             # {[major]=1 [minor]=2 [patch]=0}
#    VersionUtils.parse myMap  "1.2.0-alpha10"     # {[major]=1 [minor]=2 [patch]=0 [prerelease]=10}
#    VersionUtils.parse myMap  "1.2.0-beta.1+002"  # {[major]=1 [minor]=2 [patch]=0 [prerelease]=beta.1 [build]=002}
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 If the first version is less or equals than the second one.
# @exitcode 1 Otherwise
VersionUtils.parse() {
  local outMapName="$1"
  local version="$2"
  local -A outMap=()

  # Simplified regex than From https://semver.org/
  # It's more permissive than the realsemver but it would work for semver.
  # The same would be reused for 
  local SEMVER_REGEX="^(0|[1-9]\d*)\.(0|[1-9]\d*)?\.(0|[1-9]\d*)?-?([^+]+)?\+?([0-9A-Za-z-]+)?$"

  [[ ! $version =~ $SEMVER_REGEX ]] && return "$APASH_FUNCTION_FAILURE"
  outMap["major"]=${BASH_REMATCH[1]}
  outMap["minor"]=${BASH_REMATCH[2]}
  outMap["patch"]=${BASH_REMATCH[3]}
  outMap["prerelease"]=${BASH_REMATCH[4]}
  outMap["build"]=${BASH_REMATCH[5]}

  MapUtils.clone outMap "$outMapName" && return "$APASH_FUNCTION_SUCCESS"
  
  return "$APASH_FUNCTION_FAILURE"
}
