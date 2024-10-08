#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.add


@test "add fails when the input name does not refere to an array" {
  run ArrayUtils.add
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.add ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.add " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myVar="test"
  run ArrayUtils.add "myVar" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.add "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run ArrayUtils.add "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "add succeed when reference is an array and value is a string" {
  unset myArray
  ArrayUtils.add "myArray" "a"
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" == "a"  ]

  local myArray=()
  ArrayUtils.add "myArray" "a"
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" == "a"  ]

  ArrayUtils.add "myArray" "foo bar"
  [ "${#myArray[@]}" -eq 2  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "foo bar"  ]

  ArrayUtils.add "myArray" ""
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "foo bar"  ]
  [ "${myArray[2]}" == ""  ]
}

@test "add fails when more than 1 value is provided" {
  local myArray=("a" "b")
  run ArrayUtils.add "myArray"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 2 ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  
  run ArrayUtils.add "myArray" "c" "d"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 2  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
}
