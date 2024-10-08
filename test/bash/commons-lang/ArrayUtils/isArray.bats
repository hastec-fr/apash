#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi


@test "isArray fails when the input name does not refere an array" {
  run ArrayUtils.isArray
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isArray ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isArray "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isArray " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isArray "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.isArray "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run ArrayUtils.isArray "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "isArray returns success when the input argument is an array" {
  local myArray=()
  ArrayUtils.isArray "myArray"

  myArray=("1")
  ArrayUtils.isArray "myArray"

  myArray=("1" "2")
  ArrayUtils.isArray "myArray"
}
