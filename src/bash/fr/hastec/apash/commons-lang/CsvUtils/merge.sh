#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.StringUtils.countMatches
apash.import fr.hastec.apash.commons-lang.StringUtils.split
apash.import fr.hastec.apash.commons-lang.StringUtils.repeat

# File description ###########################################################
# @name CsvUtils.merge
# @brief Merge two csv files according to their columns keys
# @description
#   ⚠️This is a utility feature not fully tested and not complete.
#   It's currently used to generate compatibility matrix and requires
#   more development to take delimiters (today only ",") and other use 
#   cases into account.
#   
# ### Since:
# 0.2.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [CsvUtils](../CsvUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | inFile1        | string        | in       |            | The first csv file to merge.          |
# | $2     | inFile2        | string        | in       |            | The second csv file to merge          |
#
# @example
#    CsvUtils.merge file1 file2  # Merge the csv files according to first column
#
# @stdout The merge csv file.
# @stderr None.
#
# @exitcode 0 When the result csv file is displayed.
# @exitcode 1 Otherwise.
CsvUtils.merge() {
  local inFile1="$1"
  local inFile2="$2"
  local -A functionMap=()
  local functionName
  local header1 header2
  local -i nbFields1=0 nbFields2=0
  header1="$(head -n 1 "$inFile1")"
  header2="$(head -n 1 "$inFile2")"
  nbFields1=$(StringUtils.countMatches "$header1" ",")
  nbFields2=$(StringUtils.countMatches "$header2" ",")

  # Map all functions from the first file
  while IFS= read -r line; do
    functionName=${line%%,*}
    functionMap["$functionName"]="$line"
  done < <(tail -n +2 "$inFile1")

  # Map all functions from the second file
  while IFS= read -r line; do
    functionName=${line%%,*}
    if MapUtils.containsKey functionMap "$functionName"; then
      functionMap["$functionName"]+=",${line#*,}"
    else
      functionMap["$functionName"]="${functionName}$(StringUtils.repeat "$nbFields1" ","),${line#*,}"
    fi
  done < <(tail -n +2 "$inFile2")

  # Print the merged csv
  echo "$header1,${header2#*,}"
  # Loop on each values to adjust row present in the first file but not in the second
  for functionName in "${!functionMap[@]}"; do
    if [[ $(StringUtils.countMatches "${functionMap["$functionName"]}" "," ) -eq $nbFields1 ]]; then
      functionMap["$functionName"]+="$(StringUtils.repeat "$((nbFields2-1))" ",")"
    fi
    echo "${functionMap["$functionName"]}"
  done 
  return "$APASH_FUNCTION_SUCCESS"
}
