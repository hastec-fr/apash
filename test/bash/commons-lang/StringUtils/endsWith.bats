#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash/apash.sh
import fr.hastec.apash.commons-lang.StringUtils.endsWith

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