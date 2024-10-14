#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.MapUtils.containsKey
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "MapUtils.containsKey fails when the input name does not refere to a map" {
  run MapUtils.containsKey
  [ "$status" -eq 1 ]

  run MapUtils.containsKey ""
  [ "$status" -eq 1 ]

  run MapUtils.containsKey "a"
  [ "$status" -eq 1 ]

  run MapUtils.containsKey " "
  [ "$status" -eq 1 ]

  run MapUtils.containsKey "myMap" "a"
  [ "$status" -eq 1 ]

  declare -a myArray
  run MapUtils.containsKey "myArray" "a"
  [ "$status" -eq 1 ]

  unset myArray
  myArray=([0]="bar")
  run MapUtils.containsKey "myArray" "0"
  [ "$status" -eq 1 ]

}

@test "MapUtils.containsKey succeed when references is a map and value is present" {
  local -A myMap=(["foo"]="bar" ["key"]="value")
  MapUtils.containsKey "myMap" "foo"
  MapUtils.containsKey "myMap" "key"
}

@test "MapUtils.containsKey fails when references is a map but value is not present" {
  local -A myMap=(["foo"]="bar" ["key"]="value")
  run MapUtils.containsKey "myMap" "wrong"
  [ "$status" -eq 1 ]
}
