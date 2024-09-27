#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.DateUtils

# remove ######################################
@test "addMonths fails because format is not respected" {
  run DateUtils.addMonths
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addMonths "" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addMonths "20240914" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run DateUtils.addMonths "2024-09-14T10:30" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addMonths "2024-03-4T14:00:00.123+0000" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addMonths "2024-03-14T14:00:00.123+0000" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "addMonths return the date with the number of minute to add" {
  export TZ="Europe/Paris"
  run DateUtils.addMonths "2024-04-01T14:00:00.123+0200" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-05-01T14:00:00.123+0200"  ]

  run DateUtils.addMonths "2024-05-01T14:00:00.123+0200" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-01T14:00:00.123+0200"  ]

  run DateUtils.addMonths "2024-04-01T14:00:00.123+0200" 12
  [ "$status" -eq 0 ]
  [ "$output" = "2025-04-01T14:00:00.123+0200"  ]

  run DateUtils.addMonths "2024-04-01T14:00:00.123+0200" -12
  [ "$status" -eq 0 ]
  [ "$output" = "2023-04-01T14:00:00.123+0200"  ]

}

@test "addDays return the date during Summer daylight saving" {
  export TZ="Europe/Paris"
  # Summer Time 
  run DateUtils.addMonths "2024-03-01T14:00:00.123+0100" 1 
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-01T15:00:00.123+0200"  ]

  run DateUtils.addMonths "2024-04-01T15:00:00.123+0200" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-01T14:00:00.123+0100"  ]
}


@test "addDays return the date during Winter daylight saving" {
  export TZ="Europe/Paris"
  # Winter Time  
  run DateUtils.addMonths "2024-10-01T14:00:00.123+0200" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-11-01T13:00:00.123+0100"  ]

  run DateUtils.addMonths "2024-11-01T13:00:00.123+0100" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-10-01T14:00:00.123+0200"  ]
}

