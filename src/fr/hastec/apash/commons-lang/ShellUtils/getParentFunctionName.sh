#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.commons-lang.ShellUtils.getFunctionName

##/
# @name ShellUtils.getParentFunctionName
# @brief Display the name of the parent function of the current executed function.
# @description
#   If no parent of the calling function exists, then return empty.
#   It's equivalent of: ShellUtils.getFunctionName 2
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
#
# ### Example
# ```bash
#    ShellUtils.getParentFunctionName                                 # failure - ""
#    myCaller(){ ShellUtils.getParentFunctionName ; }; myCaller       # failure - ""
#    myGrandCaller() { myCaller                  ; }; myGrandCaller  # success - "myGrandCaller"
# ```
#
# @stdout The name of the parent function of the current executed function.
# @stderr None.
#
# @exitcode 0 When the input name corresponds to a variable (not including arrays and maps).
# @exitcode 1 Otherwise.
#/
ShellUtils_getParentFunctionName() {
  # Parent(3) -> Caller (2)-> getParentFunctionName(1) -> getFunctionName(0)
  ShellUtils.getFunctionName $((APASH_ARRAY_FIRST_INDEX+3)) || return "$APASH_FAILURE"
  return "$APASH_SUCCESS"
}
alias ShellUtils.getParentFunctionName="ShellUtils_getParentFunctionName"