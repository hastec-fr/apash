#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.NumberUtils.isParsable
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "NumberUtils.isParsable returns false when the input number is empty " {
  run NumberUtils.isParsable
  [ "$status" -eq 1 ]

  run NumberUtils.isParsable ""
  [ "$status" -eq 1 ]
}

@test "NumberUtils.isParsable returns false when the string contains other valid numbers" {
  run NumberUtils.isParsable "a"
  [ "$status" -eq 1 ]

  run NumberUtils.isParsable "a12"
  [ "$status" -eq 1 ]

  run NumberUtils.isParsable " 12"
  [ "$status" -eq 1 ]
}

@test "NumberUtils.isParsable returns true when the string has only digits characters, potential a minus before or potential dot" {
  NumberUtils.isParsable "123"

  NumberUtils.isParsable "-12"
  
  NumberUtils.isParsable "000"

  NumberUtils.isParsable "1"

  NumberUtils.isParsable "-123.45"

  NumberUtils.isParsable ".123"

  NumberUtils.isParsable "-.123"
}

@test "NumberUtils.isParsable returns false when the string is not parsable" {
  run NumberUtils.isParsable "--12"
  [ "$status" -eq 1 ]

  run NumberUtils.isParsable "1-2"
  [ "$status" -eq 1 ]

  run NumberUtils.isParsable " 12"
  [ "$status" -eq 1 ]

  run NumberUtils.isParsable "1."
  [ "$status" -eq 1 ]

  run NumberUtils.isParsable "0x1"
  [ "$status" -eq 1 ]

  run NumberUtils.isParsable "12L"
  [ "$status" -eq 1 ]

  run NumberUtils.isParsable "12e3"
  [ "$status" -eq 1 ]

}