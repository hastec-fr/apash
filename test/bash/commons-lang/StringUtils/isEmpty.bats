#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.isEmpty
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "StringUtils.isEmpty succeed without argument" {
  StringUtils.isEmpty
}

@test "StringUtils.isEmpty succeed with an empty argument" {
  StringUtils.isEmpty ""
}

@test "StringUtils.isEmpty failed with a blank argument" {
  run StringUtils.isEmpty " "
  [ "$status" -eq 1 ]
}

@test "StringUtils.isEmpty failed with a tab argument" {
  run StringUtils.isEmpty "	"
  [ "$status" -eq 1 ]
}

@test "StringUtils.isEmpty failed with a non empty argument" {
  run StringUtils.isEmpty "Hello World"  
  [ "$status" -eq 1 ]
}

@test "StringUtils.isEmpty failed with a non empty argument starting and finising by spaces" {
  run StringUtils.isEmpty "   Hello World   "  
  [ "$status" -eq 1 ]
}