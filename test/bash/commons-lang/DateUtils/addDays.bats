#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.DateUtils.addDays
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi


@test "DateUtils.addDays fails because format is not respected" {
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

@test "DateUtils.addDays return the date with the number of day to add" {
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

}

@test "DateUtils.addDays return the date during Summer daylight saving" {
  export TZ="Europe/Paris"
  # Summer Time 
  # @todo: mail sent to GNU, because result is not the expected one ?
  # Gnu known bug
  run DateUtils.addDays "2024-03-30T02:30:00.123+0100" 1
  skip
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-31T03:30:00.123+0200"  ]   # expectation
  # [ "$output" = "2024-03-31T04:30:00.123+0200"  ] # actual

  run DateUtils.addDays "2024-03-31T03:30:00.123+0200" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-30T02:30:00.123+0100"  ]
}

@test "DateUtils.addDays return the date during Winter daylight saving" {
  export TZ="Europe/Paris"
  # Winter Time  
  run DateUtils.addDays "2023-10-28T03:30:00.123+0200" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2023-10-29T02:30:00.123+0100"  ]

  # The reverse operation does not look to change the TZ, has been reported to GNU.
  # Answer: The bug is known, only a workaround available (anchoring at 12:00) until more global change on 
  # date time management.
  # https://www.gnu.org/software/coreutils/faq/coreutils-faq.html#The-date-command-is-not-working-right_002e
  # Gnu known bug
  # run DateUtils.addDays "2023-10-29T03:30:00.123+0200" -1
  skip
  [ "$status" -eq 0 ]
  [ "$output" = "2023-10-28T03:30:00.123+0100"  ]   # expectation
  # [ "$output" = "2023-10-28T03:30:00.123+0200"  ] # actual
}