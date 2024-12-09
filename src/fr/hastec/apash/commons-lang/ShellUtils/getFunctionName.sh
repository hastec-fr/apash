#!/usr/bin/env bash

##/
# @name ShellUtils.getFunctionName
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
#    ShellUtils.getFunctionName  0                          # ShellUtils.getFunctionName
#    myCaller(){ ShellUtils.getFunctionName   ; }; myCaller # myCaller
#    myCaller(){ ShellUtils.getFunctionName  1; }; myCaller # myCaller
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
ShellUtils_getFunctionName() {
  local inDepth="${1:-$((APASH_ARRAY_FIRST_INDEX+1))}"
  local functionName

  if [ "$APASH_SHELL" = "zsh" ]; then
    [ "$inDepth" -gt "${#funcstack[@]}" ] && return "$APASH_FAILURE"
    functionName="${funcstack[inDepth]}"
  else # bash
    [ "$inDepth" -gt "${#FUNCNAME[@]}" ] && return "$APASH_FAILURE"
    functionName="${FUNCNAME[inDepth]}"
  fi
  
  echo "$functionName" || return "$APASH_FAILURE"
  return "$APASH_SUCCESS"
}
alias ShellUtils.getFunctionName="ShellUtils_getFunctionName"