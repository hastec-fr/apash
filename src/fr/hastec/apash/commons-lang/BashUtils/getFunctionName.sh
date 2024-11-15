#!/usr/bin/env bash

##/
# @name BashUtils.getFunctionName
# @brief Display the name of the function according to the provided depth
# @description
#   Bash and zsh provide stack of the called function with environment variables ($FUNCNAME and $funcstack).
#   By default, the caller of this function is retreived (depth=1).
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
# | $1     | inDepth        | string        | in       | APASH_ARRAY_FIRST_INDEX+1 | The depth of the function to retreive.|
#
# ### Example
# ```bash
#    BashUtils.getFunctionName  0                          # BashUtils.getFunctionName
#    myCaller(){ BashUtils.getFunctionName   ; }; myCaller # myCaller
#    myCaller(){ BashUtils.getFunctionName  1; }; myCaller # myCaller
# ```
# ### Implementation note
# No check on system array (funcstack not detected as an array).
#
# @stdout The function name.
# @stderr None.
#
# @exitcode 0 When the function name is returned.
# @exitcode 1 When the index is not valid.
#/
BashUtils.getFunctionName() {
  local inDepth="${1:-$((APASH_ARRAY_FIRST_INDEX+1))}"
  local functionName

  if [ "$APASH_SHELL" = "zsh" ]; then
    [ "$inDepth" -gt "${#funcstack[@]}" ] && return "$APASH_FUNCTION_FAILURE"
    functionName="${funcstack[inDepth]}"
  else # bash
    [ "$inDepth" -gt "${#FUNCNAME[@]}" ] && return "$APASH_FUNCTION_FAILURE"
    functionName="${FUNCNAME[inDepth]}"
  fi
  
  echo "$functionName" && return "$APASH_FUNCTION_SUCCESS" 
  return "$APASH_FUNCTION_FAILURE"
}
