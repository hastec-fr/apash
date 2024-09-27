#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.remove

# min #########################################
@test "remove fails when the inputs do not refere to an array" {
  run ArrayUtils.remove
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.remove ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.remove "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.remove " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.remove "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myArray=("a" "b")
  run ArrayUtils.remove "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.remove  "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.remove "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "remove succeed when the reference is an arrays the index is valid" {
  local myArray=("a" "b" "c" "" "d")
  ArrayUtils.remove "myArray" "4"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a" ]
  [ "${myArray[1]}" == "b" ]
  [ "${myArray[2]}" == "c" ]
  [ "${myArray[3]}" == ""  ]

  ArrayUtils.remove "myArray" "2"  
  [ "${#myArray[@]}" -eq 3 ]
  [ "${myArray[0]}" == "a" ]
  [ "${myArray[1]}" == "b" ]
  [ "${myArray[2]}" == ""  ]

  ArrayUtils.remove "myArray" "0"  
  [ "${#myArray[@]}" -eq 2 ]
  [ "${myArray[0]}" == "b" ]
  [ "${myArray[1]}" == ""  ]
}

@test "remove fails when the index is not present" {
  myArray=("a")
  run ArrayUtils.remove "myArray" "4"
  [ "$status" -eq 1   ]
  [ "${#myArray[@]}" -eq 1 ]
  [ "${myArray[0]}" == "a" ]

  myArray=("a")
  run ArrayUtils.remove "myArray" "-1"
  [ "$status" -eq 1   ]
  [ "${#myArray[@]}" -eq 1 ]
  [ "${myArray[0]}" == "a" ]

  myArray=()
  run ArrayUtils.remove "myArray" "0"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 0 ]
}
