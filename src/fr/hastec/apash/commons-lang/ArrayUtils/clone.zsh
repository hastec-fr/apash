#!/usr/bin/env zsh

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
apash.import fr.hastec.apash.commons-lang.ArrayUtils.init

##/
# @name ArrayUtils.clone
# @brief Copy an array into another array using references.
# @description
#   Values and indexes are preserved.
#   Derived version from .sh to zsh.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# @see [clone](./clone.md).
#/
ArrayUtils.clone() {
  Log.in $LINENO "$@"
  local apash_ArrayUtils_clone_inArrayName="${1:-}"
  local apash_ArrayUtils_clone_outArrayName="${2:-}"

  # Check input and output arrays (initilize this last).
  ArrayUtils.isArray "$apash_ArrayUtils_clone_inArrayName"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  ArrayUtils.init "$apash_ArrayUtils_clone_outArrayName"    || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  # Add special case when only a single empty element is present in the array
  if [[ ${#${(P)1}[@]} == 1 && ${${(P)1}[@]} == "" ]]; then
    : ${(PA)apash_ArrayUtils_clone_outArrayName::=""} || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  # Copy the array when it contains elements.
  : ${(PA)apash_ArrayUtils_clone_outArrayName::="${(PA)1[@]}"} || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
