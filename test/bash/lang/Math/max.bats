#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.lang.Math.max

# min #########################################
@test "max returns empty value when at least one input is not parsable " {
  run Math.max
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.max ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.max "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.max "0" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.max "a" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}


@test "min returns the smaller of two number values." {
  run Math.max "0" "1"
  [ "$output" = "1" ]

  run Math.max "2" "103"
  [ "$output" = "103" ]

  run Math.max "1" "-1"
  [ "$output" = "1" ]
  
  run Math.max "-2" "-3"
  [ "$output" = "-2" ]

  run Math.max "0.123" ".099"
  [ "$output" = "0.123" ]

  run Math.max ".123" "-0.123"
  [ "$output" = ".123" ]
  
  run Math.max "0.123" ".123"
  [ "$output" = "0.123" ]

  run Math.max "0" "000"
  [ "$output" = "0" ]
}
