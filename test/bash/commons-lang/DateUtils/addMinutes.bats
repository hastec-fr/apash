#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.DateUtils
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "addMinutes fails because format is not respected" {
  run DateUtils.addMinutes
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addMinutes "" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addMinutes "20240914" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run DateUtils.addMinutes "2024-09-14T10:30" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addMinutes "2024-03-4T14:00:00.123+0000" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addMinutes "2024-03-14T14:00:00.123+0000" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "addMinutes return the date with the number of minute to add" {
  export TZ="Europe/Paris"
  run DateUtils.addMinutes "2024-03-14T14:00:00.123+0100" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-14T14:01:00.123+0100"  ]

  run DateUtils.addMinutes "2024-03-14T14:00:00.123+0100" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-14T13:59:00.123+0100"  ]

  run DateUtils.addMinutes "2024-03-31T14:00:00.123+0000" 60
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-31T17:00:00.123+0200"  ]

  run DateUtils.addMinutes "2024-03-31T16:00:00.123+0200" -60
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-31T15:00:00.123+0200"  ]

  # Summer Time
  run DateUtils.addMinutes "2024-03-31T01:59:00.123+0100" 1 
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-31T03:00:00.123+0200"  ]

  # Winter Time  
  run DateUtils.addMinutes "2024-10-29T02:59:00.123+0200" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-10-29T02:00:00.123+0100"  ]
}
