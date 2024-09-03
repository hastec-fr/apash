#!/usr/bin/env bash

FUNCTION_SUCCESS=0
FUNCTION_FAILURE=1

# @description Check if a CharSequence ends with a specified suffix.
# @example
#    if StringUtils.endsWith "" ""        ; then echo "true"; else echo "false"; # return true
#    if StringUtils.endsWith "abcd" ""    ; then echo "true"; else echo "false"; # return true
#    if StringUtils.endsWith "abcd" "cd"  ; then echo "true"; else echo "false"; # return true
#    if StringUtils.endsWith "abcd" "bd"  ; then echo "true"; else echo "false"; # return false
#    if StringUtils.endsWith ""     "c"   ; then echo "true"; else echo "false"; # return false
#
# @arg $1 string Input string to check
# @arg $2 the suffix to find
#
# @stdout None
# @stderr None
#
# @exitcode 0 If the string ends with the suffix
# @exitcode 1 Otherwise.
StringUtils.endsWith(){
  local str=$1
  local suffix=$2

  [[ $str =~ $suffix$ ]] && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}


# @description Compares two CharSequences, returning true if they represent equal sequences of characters.
# @example
#    if StringUtils.equals "" ""       ; then echo "true"; else echo "false"; # return true
#    if StringUtils.equals "abc" "abc" ; then echo "true"; else echo "false"; # return true
#    if StringUtils.equals "abc" "abcd"; then echo "true"; else echo "false"; # return false
#
# @arg $1 string First input string to compare
# @arg $2 string Second input string to compare
#
# @stdout None
# @stderr None
#
# @exitcode 0 If the CharSequences are equal (case-sensitive), or both empty
# @exitcode 1 Otherwise
StringUtils.equals() {
  [ "$1" == "$2" ] && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}


# @file StringUtils.sh
# @brief Operations on String considering null as empty string
# @description
#     This implementation do reference to the [java apache implementation](http://commons.apache.org/proper/commons-lang/javadocs/api-3.1/org/apache/commons/lang3/StringUtils.html)
# @see [Javadoc - StringUtils].

# @description Checks if a CharSequence is empty ("") or not existing.
# @example
#    if StringUtils.isEmpty ""           ; then echo "true"; else echo "false"; # return true
#    if StringUtils.isEmpty "     "      ; then echo "true"; else echo "false"; # return false
#    if StringUtils.isEmpty "Hello World"; then echo "true"; else echo "false"; # return false
#
# @arg $1 string Input string to evaluate
#
# @stdout None
# @stderr None
#
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
StringUtils.isEmpty() {
  local inString="$1"
  [ -z "$inString" ] && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}


# @description Finds the first index within a string
# @example
#
# @arg $1 string Input string to check
# @arg $2 the string to find
#
# @stdout The first index of the search, -1 if no match
#         or empty string input string with non empty research
# @stderr None
#
# @exitcode 0 If the index can be displayed
# @exitcode 1 Otherwise
StringUtils.indexOf() {
  local inString="$1"
  local research="$2"
  local index=-1

  # Case when string is empty but not the research
  if [[ -z "$inString" &&  -n "$research" ]]; then
    echo "$index" && return $FUNCTION_SUCCESS
    return $FUNCTION_FAILURE
  fi

  # Case when researh is empty but not the research
  if [[ -n "$inString" &&  -z "$research" ]]; then
    echo "0" && return $FUNCTION_SUCCESS
    return $FUNCTION_FAILURE
  fi

  # Case when both are empty
  if [[ -z "$inString" &&  -z "$research" ]]; then
    echo "0" && return $FUNCTION_SUCCESS
    return $FUNCTION_FAILURE
  fi  

  # Find character index in string (preffered to expr: SC2308)
  # If the number of characters remain the same, it means that no 
  # occurence has been found.
  index=${inString%%"${research}"*}
  [ ${#index} -eq ${#inString} ] && index=-1 || index=$((${#index}))

  echo "$index" && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}



# @description Search a string to find the first index 
#              of any string in the given set of string.
# @example
#
# @arg $1 string Input string to check
# @arg $2 array  The list of string to research
#
# @stdout The first minimum of index the matching research, -1 if no match
#         or empty string input or empty research
# @stderr None
#
# @exitcode 0 If the index can be displayed
# @exitcode 1 Otherwise
# see https://stackoverflow.com/questions/10953833/passing-multiple-distinct-arrays-to-a-shell-function
StringUtils.indexOfAny() {
  local inString="$1"
  local -n research="$2" 2> /dev/null || local research=()
  local index=-1
  local i

  if [[ ${#research[@]} -eq 0 ]]; then
    echo "$index" && return $FUNCTION_SUCCESS
    return $FUNCTION_FAILURE
  fi

  for r in "${research[@]}"; do
    i=$(StringUtils.indexOf "$inString" "$r")
    [[ $i -ge 0  && ($index -eq -1 || $i -lt $index) ]] && index=$i
  done

  echo "$index" && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}

# @description Checks if a CharSequence contains only whitespaces caracters or is empty or not existing.
# @example
#    if StringUtils.isBlank ""           ; then echo "true"; else echo "false"; # return true
#    if StringUtils.isBlank "     "      ; then echo "true"; else echo "false"; # return true
#    if StringUtils.isBlank "Hello World"; then echo "true"; else echo "false"; # return false
#
# @arg $1 string Input string to evaluate
#
# @stdout None
# @stderr None
#
# @exitcode 0 If no argument or an agurment of length 0 is passed.
# @exitcode 1 If the argument with at lead one character (even space) is passed.
StringUtils.isBlank() {
  local inString="$1"
  local trimString  
  trimString=$(StringUtils.trim "$inString")
  [ -z "$trimString" ] && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}



# @description Check if a CharSequence starts with a specified prefix.
# @example
#    if StringUtils.startsWith "" ""        ; then echo "true"; else echo "false"; # return true
#    if StringUtils.startsWith "abcd" ""    ; then echo "true"; else echo "false"; # return true
#    if StringUtils.startsWith "abcd" "ab"  ; then echo "true"; else echo "false"; # return true
#    if StringUtils.startsWith "abcd" "abd" ; then echo "true"; else echo "false"; # return false
#    if StringUtils.startsWith ""     "a"   ; then echo "true"; else echo "false"; # return false
#
# @arg $1 string Input string to check
# @arg $2 the prefix to find
#
# @stdout None
# @stderr None
#
# @exitcode 0 If the string starts with the prefix
# @exitcode 1 Otherwise.
StringUtils.startsWith(){
  local str=$1
  local prefix=$2

  [[ $str =~ ^$prefix ]] && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}



# @description Remove whitespaces characters from both ends of the input string.
# @example
#    StringUtils.trim ""                 # return ""
#    StringUtils.trim "     "            # return ""
#    StringUtils.trim "  Hello  World  " # return "Hello  World"
#
# @arg $1 string Input string to trim.
#
# @stdout the trimmed string
# @stderr None
#
# @exitcode 0 If the string can be displayed.
# @exitcode 1 Otherwise.
StringUtils.trim() {
  local inString="$1"
  local trimmedString=""

  trimmedString="$(echo "$inString" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  echo "$trimmedString" && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}

# @description Gets a substring from the specified String.
# @example
#    StringUtils.trim ""                 # return ""
#    StringUtils.trim "     "            # return ""
#    StringUtils.trim "  Hello  World  " # return "Hello  World"
#
# @arg $1 the String to get the substring from
# @arg $2 the position to start from, negative means count back from the end of the String by this many characters
# @arg $3 the position to end at (exclusive), negative means count back from the end of the String by this many characters
#
# @stdout substring from start position to end position, empty if empty String input
# @stderr None
#
# @exitcode 0 If the string can be displayed.
# @exitcode 1 Otherwise.
StringUtils.substring() {
  local inString="$1"
  local start=${2:-0}
  local end=${3:-${#inString}}

  # Consider negative position relative to the end of the input string
  [[ $start -lt 0 ]] && start=$((${#inString}+start))
  [[ $end -lt 0 ]]   && end=$((${#inString}+end))

  # If still negative, then consider to 0
  [[ $start -lt 0 ]] && start=0
  [[ $end -lt 0 ]] && end=0

  # If greater than the number of char in the string then get the length
  [[ $start -gt ${#inString} ]] && start=${#inString}
  [[ $end -gt ${#inString} ]] && end=${#inString}

  # If same index, or start greater than end, then return empty
  if [[ $start -ge $end ]]; then
    echo "" && return $FUNCTION_SUCCESS
    return $FUNCTION_FAILURE
  fi

  local substring=${inString:$start:$((end - start))}

  echo "$substring" && return $FUNCTION_SUCCESS
  return $FUNCTION_FAILURE
}