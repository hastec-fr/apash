#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
import fr.hastec.apash.commons-lang.StringUtils.isEmpty

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