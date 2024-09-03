#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../src/bash/commons-lang/StringUtils.sh

# setup_file(){
# }

# setup() {
# }

# endsWith ####################################
@test "endsWith succeed when the two arguments are empty" {
  run StringUtils.endsWith
}

@test "endsWith succeed with empty arguments" {
  run StringUtils.endsWith "" ""
}

@test "endsWith succeed when suffix is empty" {
  run StringUtils.endsWith "abcd" ""
}

@test "endsWith failed when suffix does not match with the end of the string" {
  run StringUtils.endsWith "abcd" "c"
  [ "$status" -eq 1 ]
}

@test "endsWith failed when suffix (longer) does not match with the end of the string" {
  run StringUtils.endsWith "abcd" "acd"
  [ "$status" -eq 1 ]
}

@test "endsWith succeed when suffix match with the end of the string" {
  run StringUtils.endsWith "abcd" "cd"
}

@test "endsWith failed when suffix is not empty but the string is empty" {
  run StringUtils.endsWith "" "c"
  [ "$status" -eq 1 ]
}

# equals #########################################
@test "equals succeed without argument" {
  run StringUtils.equals
}

@test "equals succeed with an empty argument" {
  run StringUtils.equals ""
}

@test "equals succeed with two empty arguments" {
  run StringUtils.equals "" ""
}

@test "equals succeed with two blank arguments" {
  run StringUtils.equals "  " "  "
}

@test "equals fails when blank arguments are different" {
  run StringUtils.equals "  " " "
  [ "$status" -eq 1 ]
}

@test "equals fails when arguments are different" {
  run StringUtils.equals "abc" "abcd"
  [ "$status" -eq 1 ]
}

@test "equals succeed when arguments are identical" {
  run StringUtils.equals "abc" "abc"
}

@test "equals fails when first argument is empty and not the second" {
  run StringUtils.equals "" "abc"
  [ "$status" -eq 1 ]
}

@test "equals fails when second argument is empty and not the first" {
  run StringUtils.equals "abc" ""
  [ "$status" -eq 1 ]
}


# indexOf ########################################
@test "indexOf returns 0 without arguments " {
  run StringUtils.indexOf
  [ "$output" = "0" ]
}

@test "indexOf returns 0 with empty arguments " {
  run StringUtils.indexOf "" ""
  [ "$output" = "0" ]
}

@test "indexOf returns -1 when string to check is empty and search is not empty " {
  run StringUtils.indexOf "" "*"
  [ "$output" = "-1" ]
}

@test "indexOf returns 0 when string to check is not empty and search is empty " {
  run StringUtils.indexOf "aabaabaa" ""
  [ "$output" = "0" ]
}

@test "indexOf returns 2 when third character is matching" {
  run StringUtils.indexOf "aabaabaa" "b"
  [ "$output" = "2" ]
}

@test "indexOf returns 1 when first sequence character is matching at second letter" {
  run StringUtils.indexOf "aabaabaa" "ab"
  [ "$output" = "1" ]
}

# indexOfAny ########################################
@test "indexOfAny returns -1 when no arguments " {
  run StringUtils.indexOf
  [ "$output" = "-1" ]
}

@test "indexOfAny returns -1 when no research provided" {
  run StringUtils.indexOf "abcd"
  [ "$output" = "-1" ]
}

@test "indexOfAny returns index when research match in the string" {
  local arr=( "ab" "cd" )
  run StringUtils.indexOf "zzabyycdxx" "$arr[@]"
  [ "$output" = "2" ]
}

@test "indexOfAny returns the minimum index when research match in the string" {
  local arr=( "cd" "ab" )
  run StringUtils.indexOf "zzabyycdxx" "$arr[@]"
  [ "$output" = "2" ]
}

@test "indexOfAny returns -1 when no reasearch match in the string" {
  local arr=( "mn" "op" )
  run StringUtils.indexOf "zzabyycdxx" "$arr[@]"
  [ "$output" = "-1" ]
}

@test "indexOfAny returns index on longer researh" {
  local arr=( "zab" "aby" )
  run StringUtils.indexOf "zzabyycdxx" "$arr[@]"
  [ "$output" = "1" ]
}

@test "indexOfAny returns 0 when research is empty" {
  local arr=( "" )
  run StringUtils.indexOf "zzabyycdxx" "$arr[@]"
  [ "$output" = "0" ]
}

@test "indexOfAny returns 0 when string and research are empty" {
  local arr=( "" )
  run StringUtils.indexOf "" "$arr[@]"
  [ "$output" = "0" ]
}

@test "indexOfAny returns -1 when string is empty but not the research" {
  local arr=( "a" )
  run StringUtils.indexOf "" "$arr[@]"
  [ "$output" = "-1" ]
}

# isBlank ########################################
@test "isBlank succeed without argument" {
  run StringUtils.isBlank
}

@test "isBlank succeed with an empty argument" {
  run StringUtils.isBlank ""
}

@test "isBlank succeed with a blank argument" {
  run StringUtils.isBlank " "
}

@test "isBlank succeed with multiple spaces argument" {
  run StringUtils.isBlank "    "
}

@test "isBlank succeed with a tab argument" {
  run StringUtils.isBlank "	"
}

@test "isBlank failed with a non empty argument" {
  run StringUtils.isBlank "Hello World"  
  [ "$status" -eq 1 ]
}

@test "isBlank failed with a non empty argument starting and finising by spaces" {
  run StringUtils.isBlank "   Hello World   "  
  [ "$status" -eq 1 ]
}

# isEmpty ########################################
@test "isEmpty succeed without argument" {
  run StringUtils.isEmpty
}

@test "isEmpty succeed with an empty argument" {
  run StringUtils.isEmpty ""
}

@test "isEmpty failed with a blank argument" {
  run StringUtils.isEmpty " "
  [ "$status" -eq 1 ]
}

@test "isEmpty failed with a tab argument" {
  run StringUtils.isEmpty "	"
  [ "$status" -eq 1 ]
}

@test "isEmpty failed with a non empty argument" {
  run StringUtils.isEmpty "Hello World"  
  [ "$status" -eq 1 ]
}

@test "isEmpty failed with a non empty argument starting and finising by spaces" {
  run StringUtils.isEmpty "   Hello World   "  
  [ "$status" -eq 1 ]
}


# startsWith ###################################
@test "startsWith succeed when the two arguments are empty" {
  run StringUtils.startsWith
}

@test "startsWith succeed with empty arguments" {
  run StringUtils.startsWith "" ""
}

@test "startsWith succeed when prefix is empty" {
  run StringUtils.startsWith "abcd" ""
}

@test "startsWith failed when prefix does not match with the start of the string" {
  run StringUtils.startsWith "abcd" "c"
  [ "$status" -eq 1 ]
}

@test "startsWith failed when prefix (longer) does not match with the start of the string" {
  run StringUtils.startsWith "abcd" "abd"
  [ "$status" -eq 1 ]
}

@test "startsWith succeed when prefix match with the start of the string" {
  run StringUtils.startsWith "abcd" "ab"
}

@test "startsWith failed when prefix is not empty but the string is empty" {
  run StringUtils.startsWith "" "a"
  [ "$status" -eq 1 ]
}


# Trim ########################################
@test "trim returns string without leading and tailing whitespaces but preserve middle spaces" {
  run StringUtils.trim "   Hello   World   "
  echo "$output,"
  [ "$output" = "Hello   World" ]
}

@test "trim returns empty string no characters are present" {
  run StringUtils.trim ""
  echo "$output,"
  [ "$output" = "" ]
}

@test "trim returns empty string no argument is present" {
  run StringUtils.trim
  echo "$output,"
  [ "$output" = "" ]
}


@test "trim returns empty string when only whitespaces are present (including tabs)" {
  run StringUtils.trim "   	  "
  echo "$output,"
  [ "$output" = "" ]
}

@test "trim returns string without leading spaces" {
  run StringUtils.trim "   Hello World"
  echo "$output,"
  [ "$output" = "Hello World" ]
}

@test "trim returns string without tailing spaces" {
  run StringUtils.trim "Hello World     "
  echo "$output,"
  [ "$output" = "Hello World" ]
}

@test "trim returns the current value if no space to trim" {
  run StringUtils.trim "Hello World"
  echo "$output,"
  [ "$output" = "Hello World" ]
}