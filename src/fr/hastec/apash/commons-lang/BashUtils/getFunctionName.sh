#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex

# File description ###########################################################
# @name BashUtils.getFunctionName
# @brief Display the name of the function according to the provided depth
# @description
#   Bash and zsh provide stack of the called function with environment variables ($FUNCNAME and $funcstack).
#   By default, the caller of this function is retreived (depth=1).
#
# ### Since:
# 0.2.0
# 
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inDepth        | string        | in       | APASH_ARRAY_FIRST_INDEX+1 | The depth of the function to retreive.|
#
# #### Example
# ```bash
#    BashUtils.getFunctionName  0                          # BashUtils.getFunctionName
#    myCaller(){ BashUtils.getFunctionName   ; }; myCaller # myCaller
#    myCaller(){ BashUtils.getFunctionName  1; }; myCaller # myCaller
#
# ```
# #### Implementation note
# No check on system array (funcstack not detected as an array).
#
# @stdout The function name.
# @stderr None.
#
# @exitcode 0 When the function name is returned.
# @exitcode 1 When the index is not valid.
BashUtils.getFunctionName() {
  local inDepth="${1:-$((APASH_ARRAY_FIRST_INDEX+1))}"
  local functionName

  ArrayUtils.isArrayIndex "$inDepth" || return "$APASH_FUNCTION_FAILURE"

  if [ "$APASH_SHELL" = "zsh" ]; then
    functionName="${funcstack[inDepth]}"
  else # bash
    functionName="${FUNCNAME[inDepth]}"
  fi
  
  echo "$functionName" && return "$APASH_FUNCTION_SUCCESS" 
  return "$APASH_FUNCTION_FAILURE"
}

