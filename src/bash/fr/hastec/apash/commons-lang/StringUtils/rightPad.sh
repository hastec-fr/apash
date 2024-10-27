#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isDigits

# File description ###########################################################
# @name StringUtils.rightPad
# @brief Right pad a string with a specified string.
# @description 
#
# ### Since:
# 0.1.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inString       | string        | in       |            | The string to pad out.                |
# | $2     | inSize         | number        | in       |            | The size to pad to.                   |
# | $3 ?   | inReplacement  | string        | in       | " "        | The string to pad with, empty treated as single space (default). |
#
# @example
#    StringUtils.rightPad ""     ""    ""      # failure - ""
#    StringUtils.rightPad ""     "3"   "z"     # "zzz"
#    StringUtils.rightPad "bat"  "3"   "yz"    # "bat"
#    StringUtils.rightPad "bat"  "5"   "yz"    # "batyz"
#    StringUtils.rightPad "bat"  "8"   "yz"    # "batyzyzy"
#    StringUtils.rightPad "bat"  "-1"  "z"     # "bat"
#    StringUtils.rightPad "bat"  "5"   ""      # "bat   "
#
# @stdout Right padded string or original string if no padding is necessary.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 When the size is not a positive numeric or the result cannot be displayed.
StringUtils.rightPad() {
  local inString="$1"
  local inSize="$2"
  local inPadString="${3:- }"
  local rightPadString=""

  # Check if the second argument is a valid number.
  NumberUtils.isDigits "$inSize" || return "$APASH_FUNCTION_FAILURE" 
  
  # Get the number of missing characters.
  local padCount=$((inSize - ${#inString}))

  # If the padding size is less than the string, then return the string itself.
  [[ $padCount -le 0 ]] && echo "$inString" && return "$APASH_FUNCTION_SUCCESS"

  # Calculate how much time the pad string can be added
  # and how much letter if some space are remaining.
  local padNbPattern=$((padCount / ${#inPadString}))
  local padNbRemaining=$((padCount % ${#inPadString}))
  
  # Concatenate x time the pad string then add remaining chars.
  rightPadString=$(printf "%${padNbPattern}s")
  rightPadString="${rightPadString// /"$inPadString"}"
  rightPadString+="${inPadString:0:$padNbRemaining}"

  echo "${inString}${rightPadString}" && return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}

