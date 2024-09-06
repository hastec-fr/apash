#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash/apash.sh
import fr.hastec.apash.commons-lang.StringUtils.equals

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