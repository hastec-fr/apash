#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.NumberUtils.max

# max #########################################
@test "max returns empty value when at least one input is not parsable " {
  run NumberUtils.max
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.max ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.max "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.max "0" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.max "a" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.max "a" "1" "2"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.max "0" "1" ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}


@test "max returns the greater value from a list of numbers." {
  run NumberUtils.max "0" "2" "1"
  [ "$status" -eq 0  ]
  [ "$output" = "2"  ]

  run NumberUtils.max "-2" "-3" "-4"
  [ "$status" -eq 0  ]
  [ "$output" = "-2"  ]

  run NumberUtils.max "0.123" ".099" "-1"
  [ "$status" -eq 0  ]
  [ "$output" = "0.123"  ]
  
  run NumberUtils.max "-.123" "0.123" ".123"
  [ "$status" -eq 0  ]
  [ "$output" = "0.123"  ]

  run NumberUtils.max "000" "0" "00"
  [ "$status" -eq 0  ]
  [ "$output" = "000" ]
}
