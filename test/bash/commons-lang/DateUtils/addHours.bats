#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.DateUtils.addHours
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi


@test "DateUtils.addHours fails because format is not respected" {
  run DateUtils.addHours
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addHours "" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addHours "20240914" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run DateUtils.addHours "2024-09-14T10:30" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addHours "2024-03-4T14:30:45.123+0000" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addHours "2024-03-14T14:30:45.123+0000" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "DateUtils.addHours return the date with the number of hour to add" {
  export TZ="Europe/Paris"
  run DateUtils.addHours "2024-03-14T14:30:45.123+0100" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-14T15:30:45.123+0100"  ]

  run DateUtils.addHours "2024-03-14T14:30:45.123+0100" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-14T13:30:45.123+0100"  ]

  run DateUtils.addHours "2024-03-31T14:30:45.123+0000" 24
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-01T16:30:45.123+0200"  ]

  run DateUtils.addHours "2024-04-01T14:30:45.123+0000" -24
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-31T16:30:45.123+0200"  ]

  # Summer Time
  run DateUtils.addHours "2024-03-30T02:30:00.123+0100" 24
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-31T03:30:00.123+0200"  ]

  # Winter Time  
  run DateUtils.addHours "2024-10-28T03:30:00.123+0200" 24
  [ "$status" -eq 0 ]
  [ "$output" = "2024-10-29T02:30:00.123+0100"  ]
}
