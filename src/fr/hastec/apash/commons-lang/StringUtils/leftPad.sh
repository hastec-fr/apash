#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.NumberUtils.isDigits
apash.import fr.hastec.apash.util.Log.entry
apash.import fr.hastec.apash.util.Log.exit

##/
# @name StringUtils.leftPad
# @brief Left pad a String with a specified String.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inString       | string        | in       |            | The string to pad out.                |
# | $2     | inString       | string        | in       |            | The size to pad to.                   |
# | $3 ?   | inString       | string        | in       | " "        | The string to pad with, empty treated as single space (default). |
#
# #### Example
# ```bash
#    StringUtils.leftPad ""     ""    ""      # failure - ""
#    StringUtils.leftPad ""     "3"   "z"     # "zzz"
#    StringUtils.leftPad "bat"  "3"   "yz"    # "bat"
#    StringUtils.leftPad "bat"  "5"   "yz"    # "yzbat"
#    StringUtils.leftPad "bat"  "8"   "yz"    # "yzyzybat"
#    StringUtils.leftPad "bat"  "-1"  "z"     # "bat"
#    StringUtils.leftPad "bat"  "5"   ""      # "  bat"
# ```
#
# @stdout Left padded string or original string if no padding is necessary.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 When the size is not a positive numeric or the result cannot be displayed.
#/
StringUtils.leftPad() {
  Log.entry "$LINENO" "$@"
  local inString="$1"
  local inSize="$2"
  local inPadString="${3:- }"
  local leftPadString=""
  
  Log.entry "$LINENO" "$@"

  # Check if the second argument is a valid number.
  NumberUtils.isDigits "$inSize" || { Log.exit "$LINENO" "StringUtils.leftPad-001"; return "$APASH_FUNCTION_FAILURE"; }
  
  # Get the number of missing characters.
  local padCount=$((inSize - ${#inString}))

  # If the padding size is less than the string, then return the string itself.
  [[ $padCount -le 0 ]] && echo "$inString" && { Log.exit "$LINENO" "StringUtils.leftPad-002"; return "$APASH_FUNCTION_SUCCESS"; }

  # Calculate how much time the pad string can be added
  # and how much letter if some space are remaining.
  local padNbPattern=$((padCount / ${#inPadString}))
  local padNbRemaining=$((padCount % ${#inPadString}))
  
  # Concatenate x time the pad string then add remaining chars.
  leftPadString=$(printf "%${padNbPattern}s")
  leftPadString="${leftPadString// /"$inPadString"}"
  leftPadString+="${inPadString:0:$padNbRemaining}"

  echo "${leftPadString}${inString}" && { Log.exit "$LINENO" "StringUtils.leftPad-003"; return "$APASH_FUNCTION_SUCCESS"; }

  Log.exit "$LINENO" "StringUtils.leftPad-004"; return "$APASH_FUNCTION_FAILURE"
}
