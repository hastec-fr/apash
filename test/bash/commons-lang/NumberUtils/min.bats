#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.NumberUtils.min

# min #########################################
@test "min returns empty value when at least one input is not parsable " {
  run NumberUtils.min
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.min ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.min "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.min "0" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.min "a" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.min "a" "1" "2"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.min "0" "1" ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}


@test "min returns the smaller value from a list of numbers." {
  run NumberUtils.min "0" "2" "1"
  [ "$status" -eq 0  ]
  [ "$output" = "0"  ]

  run NumberUtils.min "-2" "-3" "-4"
  [ "$status" -eq 0  ]
  [ "$output" = "-4"  ]

  run NumberUtils.min "0.123" ".099" "-1"
  [ "$status" -eq 0  ]
  [ "$output" = "-1"  ]
  
  run NumberUtils.min "-.123" "-0.123" ".123"
  [ "$status" -eq 0  ]
  [ "$output" = "-.123"  ]

  run NumberUtils.min "000" "0" "00"
  [ "$status" -eq 0  ]
  [ "$output" = "000" ]
}
