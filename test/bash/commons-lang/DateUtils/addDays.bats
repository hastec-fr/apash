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

  run DateUtils.addDays "2024-03-4T14:30:45.123+0000" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addDays "2024-03-14T14:30:45.123+0000" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "addDays return the date with the number of day to add" {
  export TZ="Europe/Paris"
  run DateUtils.addDays "2024-03-14T14:30:45.123+0100" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-15T14:30:45.123+0100"  ]

  run DateUtils.addDays "2024-03-14T14:30:45.123+0100" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-13T14:30:45.123+0100"  ]

  run DateUtils.addDays "2024-03-31T14:30:45.123+0000" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-01T16:30:45.123+0200"  ]

  run DateUtils.addDays "2024-04-01T14:30:45.123+0000" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-31T16:30:45.123+0200"  ]

  run DateUtils.addDays "2024-04-01T14:30:45.123+0200" 365
  [ "$status" -eq 0 ]
  [ "$output" = "2025-04-01T14:30:45.123+0200"  ]

  # Summer Time (correct with +24h but different with +1 day ?)
  run DateUtils.addDays "2024-03-30T02:30:00.123+0100" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-31T04:30:00.123+0200"  ]

  # Winter Time  
  run DateUtils.addDays "2024-10-28T03:30:00.123+0200" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-10-29T02:30:00.123+0100"  ]
}
