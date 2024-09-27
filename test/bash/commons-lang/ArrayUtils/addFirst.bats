#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.addFirst

# min #########################################
@test "addFirst fails when the input name does not refere to an array" {
  run ArrayUtils.addFirst
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.addFirst ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.addFirst "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.addFirst " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

}

@test "addFirst succeed and force input transformation" {
  unset myArray
  ArrayUtils.addFirst "myArray" "a"
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" == "a"  ]

  declare -A myMap
  ArrayUtils.addFirst "myMap" "a"
  [ "${#myMap[@]}" -eq 1  ]
  [ "${myMap[0]}" == "a"  ]

  local -A myMap=(["foo"]="bar")
  ArrayUtils.addFirst "myMap" "a"
  [ "${#myMap[@]}" -eq 1  ]
  [ "${myMap[0]}" == "a"  ]
}

@test "addFirst succeed when reference is an array and a value is declared" {
  local myArray=()
  ArrayUtils.addFirst "myArray" "a"
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" == "a"  ]

  myArray=("a")
  ArrayUtils.addFirst "myArray" "foo bar"
  [ "${#myArray[@]}" -eq 2  ]
  [ "${myArray[0]}" == "foo bar"  ]
  [ "${myArray[1]}" == "a"  ]

  myArray=("foo bar" "a")
  ArrayUtils.addFirst "myArray" ""
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == ""  ]
  [ "${myArray[1]}" == "foo bar"  ]
  [ "${myArray[2]}" == "a"  ]
}

@test "addFirst fails when more than 1 value is provided" {
  local myArray=("a" "b")
  run ArrayUtils.addFirst "myArray"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 2 ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  
  run ArrayUtils.addFirst "myArray" "c" "d"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 2  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
}
