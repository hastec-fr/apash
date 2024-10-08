#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.toArray

# min #########################################
@test "toArray fails when the input does not refer to an array" {
  run ArrayUtils.toArray
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.toArray ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.toArray " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myVar="dummy"
  run ArrayUtils.toArray "$myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.toArray "myArray" "0" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.toArray  "myMap" "0" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.toArray "myMap" "0" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "toArray succeed when the reference is an array" {
  myArray=()
  ArrayUtils.toArray "myArray" 2
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" == "2"  ]

  myArray=()
  ArrayUtils.toArray "myArray" "a" "b" "c" "d"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "d"  ]

  myArray=()
  ArrayUtils.toArray "myArray" "a" "2" "b"
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "2"  ]
  [ "${myArray[2]}" == "b"  ]
}

