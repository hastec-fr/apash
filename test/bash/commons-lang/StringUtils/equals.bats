#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.equals
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi


@test "StringUtils.equals succeed without argument" {
  StringUtils.equals
}

@test "StringUtils.equals succeed with an empty argument" {
  StringUtils.equals ""
}

@test "StringUtils.equals succeed with two empty arguments" {
  StringUtils.equals "" ""
}

@test "StringUtils.equals succeed with two blank arguments" {
  StringUtils.equals "  " "  "
}

@test "StringUtils.equals succeed when arguments are identical" {
  StringUtils.equals "abc" "abc"
}

@test "StringUtils.equals fails when blank arguments are different" {
  run StringUtils.equals "  " " "
  [ "$status" -eq 1 ]
}

@test "StringUtils.equals fails when arguments are different" {
  run StringUtils.equals "abc" "abcd"
  [ "$status" -eq 1 ]
}

@test "StringUtils.equals fails when first argument is empty and not the second" {
  run StringUtils.equals "" "abc"
  [ "$status" -eq 1 ]
}

@test "StringUtils.equals fails when second argument is empty and not the first" {
  run StringUtils.equals "abc" ""
  [ "$status" -eq 1 ]
}