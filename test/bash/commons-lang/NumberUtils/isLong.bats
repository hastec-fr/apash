#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.NumberUtils.isLong
  apash.import fr.hastec.apash.lang.Long
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "NumberUtils.isLong returns false when the input number is empty " {
  run NumberUtils.isLong
  [ "$status" -eq 1 ]

  run NumberUtils.isLong ""
  [ "$status" -eq 1 ]
}

@test "NumberUtils.isLong returns false when the string contains other char than digits" {
  run NumberUtils.isLong "-"
  [ "$status" -eq 1 ]
  
  run NumberUtils.isLong "1.2"
  [ "$status" -eq 1 ]

  run NumberUtils.isLong "a12"
  [ "$status" -eq 1 ]

  run NumberUtils.isLong " 12"
  [ "$status" -eq 1 ]
}

@test "NumberUtils.isLong returns true when the string has only digits characters or a minus before" {
  NumberUtils.isLong "123"

  NumberUtils.isLong "-123"
  
  NumberUtils.isLong "000"

  NumberUtils.isLong "1"
}

@test "NumberUtils.isLong returns true when the string is inside the bounds" {
  NumberUtils.isLong "$Long_MAX_VALUE"

  NumberUtils.isLong "$Long_MIN_VALUE"
}

@test "NumberUtils.isLong returns fals when the string is out of bounds" {
  run NumberUtils.isLong "9223372036854775808"
  [ "$status" -eq 1 ]

  run NumberUtils.isLong "-9223372036854775809"
  [ "$status" -eq 1 ]
}