#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.DateUtils.addSeconds
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "DateUtils.addSeconds fails because format is not respected" {
  run DateUtils.addSeconds
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addSeconds "" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addSeconds "20240914" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run DateUtils.addSeconds "2024-09-14T10:30" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addSeconds "2024-03-4T14:00:00.123+0000" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addSeconds "2024-03-14T14:00:00.123+0000" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "DateUtils.addSeconds returns the date with the number of seconds to add" {
  export TZ="Europe/Paris"
  run DateUtils.addSeconds "2024-04-01T14:00:00.123+0200" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-01T14:00:01.123+0200"  ]

  run DateUtils.addSeconds "2024-04-01T14:00:00.123+0200" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-01T13:59:59.123+0200"  ]

  run DateUtils.addSeconds "2024-04-01T14:00:00.123+0200" 60
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-01T14:01:00.123+0200"  ]

  run DateUtils.addSeconds "2024-04-01T14:00:00.123+0200" -60
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-01T13:59:00.123+0200"  ]

}

@test "DateUtils.addSeconds returns the date during Summer daylight saving" {
  export TZ="Europe/Paris"
  # Summer Time 
  run DateUtils.addSeconds "2024-04-01T01:59:59.123+0100" 1 
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-01T03:00:00.123+0200"  ]

  # Gnu known bug
  run DateUtils.addSeconds "2024-04-01T03:00:00.123+0200" -1
  skip
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-01T01:59:59.123+0100"  ]
}


@test "DateUtils.addSeconds returns the date during Winter daylight saving" {
  export TZ="Europe/Paris"
  # Winter Time  
  run DateUtils.addSeconds "2024-11-01T02:59:59.123+0200" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-11-01T02:00:00.123+0100"  ]

  # Gnu known bug
  run DateUtils.addSeconds "2024-11-01T02:00:00.123+0100" -1
  skip
  [ "$status" -eq 0 ]
  [ "$output" = "2024-11-01T02:59:59.123+0200"  ]
}

