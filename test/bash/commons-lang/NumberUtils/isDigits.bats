#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.NumberUtils.isDigits
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

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
  NumberUtils.isDigits "123"
  
  NumberUtils.isDigits "000"

  NumberUtils.isDigits "1"  
}
