#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.BashUtils.getFunctionName

##/
# @name BashUtils.getParentFunctionName
# @brief Display the name of the parent function of the current executed function.
# @description
#   If no parent of the calling function exists, then return empty.
#   It's equivalent of: BashUtils.getFunctionName 2
#
# ## History
# @since 0.2.0 (hastec-fr)
# 
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
#
# #### Example
# ```bash
#    BashUtils.getParentFunctionName                                 # failure - ""
#    myCaller(){ BashUtils.getParentFunctionName ; }; myCaller       # failure - ""
#    myGrandCaller() { myCaller                  ; }; myGrandCaller  # success - "myGrandCaller"
# ```
#
# @stdout The name of the parent function of the current executed function.
# @stderr None.
#
# @exitcode 0 When the input name corresponds to a variable (not including arrays and maps).
# @exitcode 1 Otherwise.
#/
BashUtils.getParentFunctionName() {
  # Parent(3) -> Caller (2)-> getParentFunctionName(1) -> getFunctionName(0)
  BashUtils.getFunctionName $((APASH_ARRAY_FIRST_INDEX+3)) && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
