#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.DateUtils

# remove ######################################
@test "isDate fails because format is not respected" {
  run DateUtils.isDate
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.isDate ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.isDate "20240914"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run DateUtils.isDate "2024-09-14T10:30"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.isDate "2022-03-4T14:30:45.123Z"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "isDate because it match the attended format" {
  run DateUtils.isDate "2022-03-14T14:30:45.123Z"
  [ "$status" -eq 0 ]
  [ "$output" = ""  ]
}
