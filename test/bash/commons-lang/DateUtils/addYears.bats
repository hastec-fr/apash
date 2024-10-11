#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.DateUtils.addYears
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "DateUtils.addYears fails because format is not respected" {
  run DateUtils.addYears
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addYears "" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addYears "20240914" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run DateUtils.addYears "2024-09-14T10:30" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addYears "2024-03-4T14:00:00.123+0000" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addYears "2024-03-14T14:00:00.123+0000" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "DateUtils.addYears returns the date with the number of seconds to add" {
  export TZ="Europe/Paris"
  run DateUtils.addYears "2024-04-01T14:00:00.123+0200" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2025-04-01T14:00:00.123+0200"  ]

  run DateUtils.addYears "2024-04-01T14:00:00.123+0200" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2023-04-01T14:00:00.123+0200"  ]
}

