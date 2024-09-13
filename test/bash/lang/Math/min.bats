#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.lang.Math.min

# min #########################################
@test "min returns empty value when at least one input is not parsable " {
  run Math.min
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.min ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.min "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.min "0" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.min "a" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}


@test "min returns the smaller of two number values." {
  run Math.min "0" "1"
  [ "$output" = "0" ]

  run Math.min "2" "103"
  [ "$output" = "2" ]

  run Math.min "1" "-1"
  [ "$output" = "-1" ]
  
  run Math.min "-2" "-3"
  [ "$output" = "-3" ]

  run Math.min "0.123" ".099"
  [ "$output" = ".099" ]

  run Math.min "-.123" "0.123"
  [ "$output" = "-.123" ]

  run Math.min "000" "0"
  [ "$output" = "0" ]
}
