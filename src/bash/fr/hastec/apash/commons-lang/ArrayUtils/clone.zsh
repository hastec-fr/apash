#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty

ArrayUtils.clone() {
  local inArrayName="$1"
  local outArrayName="$2"
  ArrayUtils.isArray "$inArrayName"      || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.nullToEmpty "$outArrayName" || return "$APASH_FUNCTION_FAILURE"
  
  : ${(PA)outArrayName::="${(PA)1[@]}"} || return "$APASH_FUNCTION_FAILURE"

  return "$APASH_FUNCTION_SUCCESS"
}
