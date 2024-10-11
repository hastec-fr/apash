#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.BashUtils.isDeclared
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "BashUtils.isDeclared fails when the input name is not a valid variable name" {
  run BashUtils.isDeclared
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isDeclared ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isDeclared "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "BashUtils.isDeclared succeed when the variable has been declared" {
  local myVar="myValue"
  BashUtils.isDeclared "myVar"

  declare -a myArray=()
  BashUtils.isDeclared "myArray"

  declare -A myMap=([foo]=bar)
  BashUtils.isDeclared "myMap"
}
