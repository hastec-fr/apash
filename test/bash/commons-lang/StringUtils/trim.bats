#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.StringUtils.trim

# Trim ########################################
@test "trim returns string without leading and tailing whitespaces but preserve middle spaces" {
  run StringUtils.trim "   Hello   World   "
  [ "$output" = "Hello   World" ]
}

@test "trim returns empty string no characters are present" {
  run StringUtils.trim ""
  [ "$output" = "" ]
}

@test "trim returns empty string no argument is present" {
  run StringUtils.trim
  [ "$output" = "" ]
}


@test "trim returns empty string when only whitespaces are present (including tabs)" {
  run StringUtils.trim "   	  "
  [ "$output" = "" ]
}

@test "trim returns string without leading spaces" {
  run StringUtils.trim "   Hello World"
  [ "$output" = "Hello World" ]
}

@test "trim returns string without tailing spaces" {
  run StringUtils.trim "Hello World     "
  [ "$output" = "Hello World" ]
}

@test "trim returns the current value if no space to trim" {
  run StringUtils.trim "Hello World"
  [ "$output" = "Hello World" ]
}