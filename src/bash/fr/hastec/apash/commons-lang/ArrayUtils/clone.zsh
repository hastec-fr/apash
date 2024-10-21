#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.init

ArrayUtils.clone() {
  local inArrayName="$1"
  local outArrayName="$2"
  ArrayUtils.isArray "$inArrayName"  || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.init "$outArrayName"    || return "$APASH_FUNCTION_FAILURE"
  
  # Add special case when only a single empty element is present in the array
  [[ ${#${(PA)1[@]}} == 1 && ${(PA)1[@]} == "" ]] && : ${(PA)outArrayName::=("")} && return "$APASH_FUNCTION_SUCCESS"
  : ${(PA)outArrayName::="${(PA)1[@]}"} || return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}
