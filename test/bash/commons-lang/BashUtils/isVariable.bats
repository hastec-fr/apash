#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.BashUtils.isVariable
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "isVariable fails when the input name is not a valid variable name" {
  run BashUtils.isVariable
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isVariable ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isVariable "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "isVariable succeed when the variable has been declared" {
  local myVar="myValue"
  BashUtils.isVariable "myVar"
}

@test "isVariable fails when the variable is an array or a map" {
  declare -a myArray=()
  run BashUtils.isVariable "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap=([foo]=bar)
  run BashUtils.isVariable "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}