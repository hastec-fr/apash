#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.substring
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "StringUtils.substring returns empty when no arguments " {
  run StringUtils.substring
}

@test "StringUtils.substring returns empty when the input argument is empty" {
  run StringUtils.substring ""
  [ "$output" = "" ]

  run StringUtils.substring "" 0
  [ "$output" = "" ]

  run StringUtils.substring "" 0 1
  [ "$output" = "" ]
}

@test "StringUtils.substring returns correct substring for nominal cases" {
  run StringUtils.substring "abc" 0 2
  [ "$output" = "ab" ]

  run StringUtils.substring "abc" 0 -1
  [ "$output" = "ab" ]

  run StringUtils.substring "abc" 2 4
  [ "$output" = "c" ]

  run StringUtils.substring "abc" -2 -1
  [ "$output" = "b" ]

  run StringUtils.substring "abc" -4 2
  [ "$output" = "ab" ]

  run StringUtils.substring "abc" 2 6
  [ "$output" = "c" ]
}

@test "StringUtils.substring returns empty when the indexes are equal" {
  run StringUtils.substring "abc" 2 2
  [ "$output" = "" ]
}

@test "StringUtils.substring returns empty when start is greater than end" {
  run StringUtils.substring "abc" 2 0
  [ "$output" = "" ]
}

@test "StringUtils.substring returns empty when start is greater than string" {
  run StringUtils.substring "abc" 4 6
  [ "$output" = "" ]
}

@test "StringUtils.substring returns empty when end is less than 0" {
  run StringUtils.substring "abc" -4 -6
  [ "$output" = "" ]
}