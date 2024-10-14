#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.rotate
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "StringUtils.rotate returns empty string when shift is not parsable)" {
  run StringUtils.rotate "abc" " "
  [ "$status" = 1  ]
  [ "$output" = "" ]

  run StringUtils.rotate "abc" "a"
  [ "$status" = 1  ]
  [ "$output" = "" ]

  run StringUtils.rotate "abc" "1a"
  [ "$status" = 1  ]
  [ "$output" = "" ]
}

@test "StringUtils.rotate returns the original string when shift 0 or empty" {
  run StringUtils.rotate
  [ "$status" = 0  ]
  [ "$output" = "" ]

  run StringUtils.rotate ""
  [ "$status" = 0  ]
  [ "$output" = "" ]

  run StringUtils.rotate "" ""
  [ "$status" = 0  ]
  [ "$output" = "" ]

  run StringUtils.rotate "abc" ""
  [ "$status" = 0  ]
  [ "$output" = "abc" ]

  run StringUtils.rotate "" "0"
  [ "$status" = 0  ]
  [ "$output" = "" ]

  run StringUtils.rotate "abc"
  [ "$status" = 0     ]
  [ "$output" = "abc" ]

  run StringUtils.rotate "abc" "0"
  [ "$status" = 0     ]
  [ "$output" = "abc" ]
}


@test "StringUtils.rotate returns the string with right rotation when shift is greater than 0" {
  run StringUtils.rotate "abcdefg" "2"
  [ "$status" = 0 ]
  [ "$output" = "fgabcde" ]

  run StringUtils.rotate "abcdefg" "7"
  [ "$status" = 0 ]
  [ "$output" = "abcdefg" ]

  run StringUtils.rotate "abcdefg" "9"
  [ "$status" = 0 ]
  [ "$output" = "fgabcde" ]
}


@test "StringUtils.rotate returns the string with left rotation when shift is less than 0" {
  run StringUtils.rotate "abcdefg" "-2"
  [ "$status" = 0 ]
  [ "$output" = "cdefgab" ]

  run StringUtils.rotate "abcdefg" "-7"
  [ "$status" = 0 ]
  [ "$output" = "abcdefg" ]

  run StringUtils.rotate "abcdefg" "-9"
  [ "$status" = 0 ]
  [ "$output" = "cdefgab" ]
}
