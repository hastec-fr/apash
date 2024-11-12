#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndexValid

# File description ###########################################################
# @name BashUtils.getLineNumber
# @brief Display the line number of the executed function.
# @description
#   Bash provides stack of the called function with environment variables ($BASH_LINENO)
#   Other shells must provide the current line number of the caller with $LINENO.
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
#    BashUtils.getLineNumber  0                          # BashUtils.getLineNumber
#    myCaller(){ BashUtils.getLineNumber   ; }; myCaller # myCaller
#    myCaller(){ BashUtils.getLineNumber  1; }; myCaller # myCaller
#
# ```
#
# @stdout The function name.
# @stderr None.
#
# @exitcode 0 When the function name is returned.
# @exitcode 1 When the index is not valid.
BashUtils.getLineNumber() {
  local inDepth="${1:-$((APASH_ARRAY_FIRST_INDEX+1))}"
  local 
  local functionArray="FUNCNAME"
  local functionName

  [ "$APASH_SHELL" = "zsh" ] && functionArray="funcstack"
  
  if [ "$APASH_SHELL" = "zsh" ]; then
    functionName="${funcstack[inDepth]}"
  else # bash
    ArrayUtils.isArrayIndexValid "BASH_LINENO" "$inDepth" || return "$APASH_FUNCTION_FAILURE"
    functionName="${FUNCNAME[inDepth]}"
  fi
  echo "$functionName" && return "$APASH_FUNCTION_SUCCESS"
 
  return "$APASH_FUNCTION_FAILURE"
}

