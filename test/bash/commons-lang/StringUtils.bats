#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../src/bash/commons-lang/StringUtils.sh

# setup_file(){
# }

# setup() {
# }

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

@test "isEmpty succeed with a tab argument" {
  run StringUtils.isBlank "	"
}

@test "isEmpty failed with a non empty argument" {
  run StringUtils.isEmpty "Hello World"  
  [ "$status" -eq 1 ]
}

@test "isEmpty failed with a non empty argument starting and finising by spaces" {
  run StringUtils.isEmpty "   Hello World   "  
  [ "$status" -eq 1 ]
}

# Trim ########################################
@test "trim returns string without leading and tailing whitespaces but preserve middle spaces" {
  run StringUtils.trim "   Hello   World   "
  echo "$output,"
  [ "$output" = "Hello   World" ]
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