#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.NumberUtils.isDigits

# remove ######################################
@test "isDigits returns false when the input number is empty " {
  run NumberUtils.isDigits
  [ "$status" -eq 1 ]

  run NumberUtils.isDigits ""
  [ "$status" -eq 1 ]
}

@test "isDigits returns false when the string other char than digits" {
  run NumberUtils.isDigits "-12"
  [ "$status" -eq 1 ]
  
  run NumberUtils.isDigits "1.2"
  [ "$status" -eq 1 ]

  run NumberUtils.isDigits "a12"
  [ "$status" -eq 1 ]

  run NumberUtils.isDigits " 12"
  [ "$status" -eq 1 ]
}

@test "isDigits returns true when the string has only digits characters" {
  run NumberUtils.isDigits "123"
  
  run NumberUtils.isDigits "000"

  run NumberUtils.isDigits "1"  
}
