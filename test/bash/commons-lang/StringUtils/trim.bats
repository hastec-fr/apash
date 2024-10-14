#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.trim
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "StringUtils.trim returns string without leading and tailing whitespaces but preserve middle spaces" {
  run StringUtils.trim "   Hello   World   "
  [ "$output" = "Hello   World" ]
}

@test "StringUtils.trim returns empty string no characters are present" {
  run StringUtils.trim ""
  [ "$output" = "" ]
}

@test "StringUtils.trim returns empty string no argument is present" {
  run StringUtils.trim
  [ "$output" = "" ]
}


@test "StringUtils.trim returns empty string when only whitespaces are present (including tabs)" {
  run StringUtils.trim "   	  "
  [ "$output" = "" ]
}

@test "StringUtils.trim returns string without leading spaces" {
  run StringUtils.trim "   Hello World"
  [ "$output" = "Hello World" ]
}

@test "StringUtils.trim returns string without tailing spaces" {
  run StringUtils.trim "Hello World     "
  [ "$output" = "Hello World" ]
}

@test "StringUtils.trim returns the current value if no space to trim" {
  run StringUtils.trim "Hello World"
  [ "$output" = "Hello World" ]
}