#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.lang.Math.max
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

setup_file(){
  bats_require_minimum_version 1.5.0
}

# max #########################################
@test "Math.max returns empty value when at least one input is not parsable " {
  run --separate-stderr Math.max
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr Math.max ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr Math.max "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr Math.max "0" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr Math.max "a" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}


@test "Math.max returns the greater value of two number." {
  run --separate-stderr Math.max "0" "1"
  [ "$output" = "1" ]

  run --separate-stderr Math.max "2" "103"
  [ "$output" = "103" ]

  run --separate-stderr Math.max "1" "-1"
  [ "$output" = "1" ]
  
  run --separate-stderr Math.max "-2" "-3"
  [ "$output" = "-2" ]

  run --separate-stderr Math.max "0.123" ".099"
  [ "$output" = "0.123" ]

  run --separate-stderr Math.max ".123" "-0.123"
  [ "$output" = ".123" ]
  
  run --separate-stderr Math.max "0.123" ".123"
  [ "$output" = "0.123" ]

  run --separate-stderr Math.max "0" "000"
  [ "$output" = "0" ]
}
