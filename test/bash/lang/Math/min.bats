#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.lang.Math.min
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

setup_file(){
  bats_require_minimum_version 1.5.0
}


@test "Math.min returns empty value when at least one input is not parsable " {
  run --separate-stderr Math.min
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr Math.min ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr Math.min "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr Math.min "0" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr Math.min "a" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}


@test "Math.min returns the smaller of two number values." {
  run --separate-stderr Math.min "0" "1"
  [ "$output" = "0" ]

  run --separate-stderr Math.min "2" "103"
  [ "$output" = "2" ]

  run --separate-stderr Math.min "1" "-1"
  [ "$output" = "-1" ]
  
  run --separate-stderr Math.min "-2" "-3"
  [ "$output" = "-3" ]

  run --separate-stderr Math.min "0.123" ".099"
  [ "$output" = ".099" ]

  run --separate-stderr Math.min "-.123" "0.123"
  [ "$output" = "-.123" ]

  run --separate-stderr Math.min ".123" "0.123"
  [ "$output" = ".123" ]

  run --separate-stderr Math.min "000" "0" 
  [ "$output" = "000" ]
}
