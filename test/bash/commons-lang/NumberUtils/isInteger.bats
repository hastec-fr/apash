#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.NumberUtils.isInteger
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "NumberUtils.isInteger returns false when the input number is empty " {
  run NumberUtils.isInteger
  [ "$status" -eq 1 ]

  run NumberUtils.isInteger ""
  [ "$status" -eq 1 ]
}

@test "NumberUtils.isInteger returns false when the string contains other char than digits" {
  run NumberUtils.isInteger "-"
  [ "$status" -eq 1 ]
  
  run NumberUtils.isInteger "1.2"
  [ "$status" -eq 1 ]

  run NumberUtils.isInteger "a12"
  [ "$status" -eq 1 ]

  run NumberUtils.isInteger " 12"
  [ "$status" -eq 1 ]
}

@test "NumberUtils.isInteger returns true when the string has only digits characters or a minus before" {
  NumberUtils.isInteger "123"

  NumberUtils.isInteger "-123"
  
  NumberUtils.isInteger "000"

  NumberUtils.isInteger "1"
}
