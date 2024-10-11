#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.containsOnly
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "StringUtils.containsOnly succeed without arguments" {
  StringUtils.containsOnly
}

@test "StringUtils.containsOnly succeed with empty input string" {
  StringUtils.containsOnly ""

  StringUtils.containsOnly "" ""

  StringUtils.containsOnly "" "abc"
}

@test "StringUtils.containsOnly succeed when string contains only provided characters" {
  StringUtils.containsOnly "abab" "abc"

  StringUtils.containsOnly "a[b" "a[bc"
}

@test "StringUtils.containsOnly failed when inputs string is not null but charsequence is" {
  run StringUtils.containsOnly "abc" ""
  [ "$status" -eq 1 ]
}

@test "StringUtils.containsOnly failed when string does not contains only provided characters" {
  run StringUtils.containsOnly "ab1" "abc"
  [ "$status" -eq 1 ]

  run StringUtils.containsOnly "abz" "abc"
  [ "$status" -eq 1 ]

  run StringUtils.containsOnly "a[bd" "a[bc"
  [ "$status" -eq 1 ]
}
