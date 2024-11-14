#!/usr/bin/env zsh

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.init

##/
# @name ArrayUtils.clone
# @brief Copy an array into another array using references.
# @description
#   Values and indexes are preserved.
#   Derived version for zsh.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# @see [clone](./clone.md).
#/
ArrayUtils.clone() {
  Log.entry "$LINENO" "$@"
  local apash_ArrayUtils_clone_inArrayName="$1"
  local apash_ArrayUtils_clone_outArrayName="$2"
  ArrayUtils.isArray "$apash_ArrayUtils_clone_inArrayName"  || { Log.exception "$LINENO" "zsh.ArrayUtils.clone-001"; return "$APASH_FUNCTION_FAILURE"; }
  ArrayUtils.init "$apash_ArrayUtils_clone_outArrayName"    || { Log.exception "$LINENO" "zsh.ArrayUtils.clone-002"; return "$APASH_FUNCTION_FAILURE"; }
  
  # Add special case when only a single empty element is present in the array
  [[ ${#${(P)1}[@]} == 1 && ${${(P)1}[@]} == "" ]] && : ${(PA)apash_ArrayUtils_clone_outArrayName::=""} && return "$APASH_FUNCTION_SUCCESS"
  : ${(PA)apash_ArrayUtils_clone_outArrayName::="${(PA)1[@]}"} || { Log.exception "$LINENO" "zsh.ArrayUtils.clone-003"; return "$APASH_FUNCTION_FAILURE"; }
  Log.exit "$LINENO" "zsh.ArrayUtils.clone-004"; return "$APASH_FUNCTION_SUCCESS"
}

