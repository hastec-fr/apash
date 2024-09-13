#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.StringUtils.isAnyEmpty

# isEmpty ########################################
@test "isAnyEmpty succeed without argument" {
  StringUtils.isAnyEmpty
}

@test "isAnyEmpty succeed with at least an empty argument" {
  StringUtils.isAnyEmpty ""

  StringUtils.isAnyEmpty "" "foo"

  StringUtils.isAnyEmpty "bob" ""

  StringUtils.isAnyEmpty "  bob  " ""
}


@test "isAnyEmpty failed with only non empty argument" {
  run StringUtils.isAnyEmpty " "
  [ "$status" -eq 1 ]

  run StringUtils.isAnyEmpty "	"
  [ "$status" -eq 1 ]

  run StringUtils.isAnyEmpty "Hello World"  
  [ "$status" -eq 1 ]

  run StringUtils.isAnyEmpty "   Hello World   "  
  [ "$status" -eq 1 ]

  run StringUtils.isAnyEmpty " " "bar"
  [ "$status" -eq 1 ]

  run StringUtils.isAnyEmpty "foo" "bar"
  [ "$status" -eq 1 ]
}
