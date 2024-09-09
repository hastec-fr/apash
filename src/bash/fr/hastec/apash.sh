#!/usr/bin/env bash

# <!-- @package -->
# @file apash.sh
# @brief Translation from most of the apache libraries for shell.
# @description
#     Provides highly reusable utility methods.
#
# ### Method Summary
# <!-- apash.summaryTableBegin -->
# | Methods                  | Brief                                 |
# |--------------------------|---------------------------------------|
# |[commons-lang](apash/commons-lang.md)|Provides highly reusable utility methods.|
# <!-- apash.summaryTableEnd -->


# Declaration of global variables
export APASH_FUNCTION_SUCCESS=0
export APASH_FUNCTION_FAILURE=1
declare -A APASH_LIBRARIES
export APASH_LIBRARIES
APASH_BASH_DIR="$(realpath "$( dirname -- "${BASH_SOURCE[0]}" )/../../..")"
export APASH_BASH_DIR

import(){
  local lib
  local libs=()

  for l in "$@"; do
    locations="$APASH_BASH_DIR/${l//./\/}"
    if [ -d "$locations" ]; then
      locations="$locations/*.sh"
      for lib in $locations; do
        libs+=("$lib")
      done
    elif [ -r "$locations.sh" ]; then
      libs+=("$locations.sh")
    else
      continue
    fi
  done

  for lib in "${libs[@]}"; do
    [ ! -r "$lib" ] && echo "WARNING: library missing" && continue
    if [[ ! -v ${APASH_LIBRARIES["$lib"]} ]]; then
      # shellcheck disable=SC1090
      source "$lib"
      APASH_LIBRARIES["$lib"]=true
    fi
  done
}