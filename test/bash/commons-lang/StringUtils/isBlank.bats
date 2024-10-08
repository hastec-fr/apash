#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.isBlank
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "isBlank succeed without argument" {
  StringUtils.isBlank
}

@test "isBlank succeed with an empty argument" {
  StringUtils.isBlank ""
}

@test "isBlank succeed with a blank argument" {
  StringUtils.isBlank " "
}

@test "isBlank succeed with multiple spaces argument" {
  StringUtils.isBlank "    "
}

@test "isBlank succeed with a tab argument" {
  StringUtils.isBlank "	"
}

@test "isBlank failed with a non empty argument" {
  run StringUtils.isBlank "Hello World"  
  [ "$status" -eq 1 ]
}

@test "isBlank failed with a non empty argument starting and finising by spaces" {
  run StringUtils.isBlank "   Hello World   "  
  [ "$status" -eq 1 ]
}