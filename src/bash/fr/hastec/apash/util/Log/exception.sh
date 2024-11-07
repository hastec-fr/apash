#!/usr/bin/env bash

# Dependencies ##############################################################
apash.import fr.hastec.apash.util.Log.message
apash.import fr.hastec.apash.commons-lang.BashUtils.getParentFunctionName
apash.import fr.hastec.apash.lang.Math.min

# File description ###########################################################
# @name Log.exception
# @brief Log an error message due to an unexpected behavior and print the stack.
# @description
#   The message is mandatory pushed to error channel.
#
# ### Since:
# 0.2.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default   | Description                           |
# |--------|----------------|---------------|----------|-----------|---------------------------------------|
# | $1     | inLineNumber   | number        | in       |           | The line number of the log.           |
# | $2     | inLabel        | string        | in       |           | The corresponding exit label.         |
#
# @example
#    cat <<EOF
#    apash.import fr.hastec.apash.util.Log.exception
#    myFunc() { Log.exception "$LINENO" "myFunc-001" "InvalidNumber"; }
#    myGrandFunc() { 
#        echo test
#        myFunc;
#    }
#    EOF > test.sh && chmod +x test.sh
#    
#    ./test.sh     # &2: 2024-11-06T08:27:11.213+0000 [TRACE] myFunc (2): Exception InvalidNumber at myFunc-001
#                  #       at myFunc(./test.sh:2)
#                  #       at myGrandFunc(./test.sh:5)
#                  #       at main(./test.sh:8)
#
# @stdout None.
# @stderr The message to log.
#
# @exitcode 0 When the message has been logged.
# @exitcode 1 Otherwise.
Log.exception() {
  [ "$APASH_LOG_LEVEL_ERROR" -gt "$APASH_LOG_LEVEL" ] && return "$APASH_FUNCTION_SUCCESS"
  local inLineNumber="$1"
  local inLabel="$2"
  local inException="${3:-UnexpectedException}"
  local parentFunction
  local outMessage="Exception $inException at $inLabel"
  local i

  if [ "$APASH_LOG_STACK_TRACE" = "true" ]; then
    local APASH_LOG_STACK_TRACE_MAX_DEFAULT=10
    local APASH_LOG_STACK_TRACE_MAX=${APASH_LOG_STACK_TRACE_MAX:-$APASH_LOG_STACK_TRACE_MAX_DEFAULT}
    local stackSize
    local stackBound
    if [ "$APASH_SHELL" = "bash" ]; then
      stackSize="${#FUNCNAME[@]}"
      stackBound="$(Math.min "$APASH_LOG_STACK_TRACE_MAX" "$((APASH_ARRAY_FIRST_INDEX+stackSize-1))" || echo $APASH_LOG_STACK_TRACE_MAX_DEFAULT )"
      for (( i=APASH_ARRAY_FIRST_INDEX; i < stackBound; i++ )); do
        outMessage+=$'\n'"  at ${FUNCNAME[i+1]}(${BASH_SOURCE[i+1]}:${BASH_LINENO[i]})"
      done
    elif [ "$APASH_SHELL" = "zsh" ]; then
      stackSize="${#funcfiletrace[@]}"
      stackBound="$(Math.min "$APASH_LOG_STACK_TRACE_MAX" "$((APASH_ARRAY_FIRST_INDEX+stackSize-1))" || echo $APASH_LOG_STACK_TRACE_MAX_DEFAULT )"
      for (( i=APASH_ARRAY_FIRST_INDEX+1; i < stackBound; i++ )); do
        outMessage+=$'\n'"  at ${funcstack[i]}(${funcfiletrace[i]})"
      done
    fi
    # Add "..." in case the stack is too long.
    [ "$APASH_LOG_STACK_TRACE_MAX" -le "$stackBound" ] && outMessage+=$'\n'"  ..."
  fi

  parentFunction="$(BashUtils.getParentFunctionName)"

  Log.message "$APASH_LOG_LEVEL_ERROR" "$parentFunction" "$inLineNumber" "$outMessage" && return "$APASH_FUNCTION_SUCCESS"
  return "$APASH_FUNCTION_FAILURE"
}
