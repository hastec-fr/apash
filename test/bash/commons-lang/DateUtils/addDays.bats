#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.DateUtils

# remove ######################################
@test "addDays fails because format is not respected" {
  run DateUtils.addDays
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addDays "" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addDays "20240914" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run DateUtils.addDays "2024-09-14T10:30" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addDays "2024-03-4T14:30:45.123Z" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addDays "2024-03-14T14:30:45.123Z" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "addDays return the date with the number of day to add" {
  run DateUtils.addDays "2024-03-14T14:30:45.123Z" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-15T14:30:45.123Z"  ]

  run DateUtils.addDays "2024-03-14T14:30:45.123Z" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-13T14:30:45.123Z"  ]

  run DateUtils.addDays "2024-03-31T14:30:45.123Z" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-01T14:30:45.123Z"  ]

  run DateUtils.addDays "2024-04-01T14:30:45.123Z" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-31T14:30:45.123Z"  ]

  run DateUtils.addDays "2024-04-01T14:30:45.123Z" 365
  [ "$status" -eq 0 ]
  [ "$output" = "2025-04-01T14:30:45.123Z"  ]
}
