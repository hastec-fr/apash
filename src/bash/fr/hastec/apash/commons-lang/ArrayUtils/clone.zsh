#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.init

ArrayUtils.clone() {
  local ref_ArrayUtils_clone_inArrayName="$1"
  local ref_ArrayUtils_clone_outArrayName="$2"
  ArrayUtils.isArray "$ref_ArrayUtils_clone_inArrayName"  || return "$APASH_FUNCTION_FAILURE"
  ArrayUtils.init "$ref_ArrayUtils_clone_outArrayName"    || return "$APASH_FUNCTION_FAILURE"
  
  # Add special case when only a single empty element is present in the array
  [[ ${#${(P)1}[@]} == 1 && ${(P)1[@]} == "" ]] && : ${(PA)ref_ArrayUtils_clone_outArrayName::=("")} && return "$APASH_FUNCTION_SUCCESS"
  : ${(PA)ref_ArrayUtils_clone_outArrayName::="${(PA)1[@]}"} || return "$APASH_FUNCTION_FAILURE"
  return "$APASH_FUNCTION_SUCCESS"
}
