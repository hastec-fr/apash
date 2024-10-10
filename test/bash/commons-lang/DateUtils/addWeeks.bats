#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.DateUtils.addWeeks
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "addWeeks fails because format is not respected" {
  run DateUtils.addWeeks
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addWeeks "" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addWeeks "20240914" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run DateUtils.addWeeks "2024-09-14T10:30" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addWeeks "2024-03-4T14:00:00.123+0000" 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run DateUtils.addWeeks "2024-03-14T14:00:00.123+0000" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "addWeeks returns the date with the number of seconds to add" {
  export TZ="Europe/Paris"
  run DateUtils.addWeeks "2024-04-01T14:00:00.123+0200" 1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-04-08T14:00:00.123+0200"  ]

  run DateUtils.addWeeks "2024-04-01T14:00:00.123+0200" -1
  [ "$status" -eq 0 ]
  [ "$output" = "2024-03-25T13:00:00.123+0100"  ]

  run DateUtils.addWeeks "2024-04-01T14:00:00.123+0200" 5
  [ "$status" -eq 0 ]
  [ "$output" = "2024-05-06T14:00:00.123+0200"  ]

  run DateUtils.addWeeks "2024-04-01T14:00:00.123+0200" -5
  [ "$status" -eq 0 ]
  [ "$output" = "2024-02-26T13:00:00.123+0100"  ]

}

