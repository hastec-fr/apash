#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.MapUtils.isMap


@test "isMap fails when the input name does not refere a map" {
  run MapUtils.isMap
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MapUtils.isMap ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MapUtils.isMap "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MapUtils.isMap " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MapUtils.isMap "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -a myArray
  run MapUtils.isMap "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=()
  run MapUtils.isMap "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}


@test "isArray returns success when the input argument is an array" {
  declare -A myMap
  MapUtils.isMap "myMap"

  myMap=(["Hello"]="World")
  MapUtils.isMap "myMap"

  myMap=(["foo"]="bar" ["key"]="value")
  MapUtils.isMap "myMap"
}
