#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/commons-lang/StringUtils.sh

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