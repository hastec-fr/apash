#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.NumberUtils.isInteger

# remove ######################################
@test "isDigits returns false when the input number is empty " {
  run NumberUtils.isInteger
  [ "$status" -eq 1 ]

  run NumberUtils.isInteger ""
  [ "$status" -eq 1 ]
}

@test "isDigits returns false when the string contains other char than digits" {
  run NumberUtils.isInteger "-"
  [ "$status" -eq 1 ]
  
  run NumberUtils.isInteger "1.2"
  [ "$status" -eq 1 ]

  run NumberUtils.isInteger "a12"
  [ "$status" -eq 1 ]

  run NumberUtils.isInteger " 12"
  [ "$status" -eq 1 ]
}

@test "isDigits returns true when the string has only digits characters or a minus before" {
  NumberUtils.isInteger "123"

  NumberUtils.isInteger "-123"
  
  NumberUtils.isInteger "000"

  NumberUtils.isInteger "1"
}
