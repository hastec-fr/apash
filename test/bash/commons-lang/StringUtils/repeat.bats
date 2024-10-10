#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.repeat
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "repeat fails when input is not a valid positive number" {
  run StringUtils.repeat a "a"
  [ "$status" = 1  ]
}

@test "repeat returns the repeated string" {
  run StringUtils.repeat 3 "a"
  [ "$status" = 0  ]
  [ "$output" = "aaa" ]

  run StringUtils.repeat 2 "ab"
  [ "$status" = 0 ]
  [ "$output" = "abab" ]
}
