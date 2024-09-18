#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.swap

# min #########################################
@test "swap fails when the input does not refer to an array" {
  run ArrayUtils.swap
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.swap ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.swap " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myVar="dummy"
  run ArrayUtils.swap "$myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.swap "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]  

  declare -A myMap
  run ArrayUtils.swap  "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myMap=(["foo"]="a")
  run ArrayUtils.swap "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "swap succeed when the reference is an array and offset are declared" {
  myArray=("a" "b" "c" "d")
  ArrayUtils.swap "myArray" 0 2
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "c"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "a"  ]
  [ "${myArray[3]}" == "d"  ]

  myArray=("a" "b" "c" "d")
  ArrayUtils.swap "myArray" 0 2 1
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "c"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "a"  ]
  [ "${myArray[3]}" == "d"  ]

  myArray=("a" "b" "c" "d")
  ArrayUtils.swap "myArray" 0 2 2
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "c"  ]
  [ "${myArray[1]}" == "d"  ]
  [ "${myArray[2]}" == "a"  ]
  [ "${myArray[3]}" == "b"  ]

  myArray=("a" "b" "c" "d")
  ArrayUtils.swap "myArray" 0 2 0
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "d"  ]

  myArray=("a" "b" "c" "d" "e")
  ArrayUtils.swap "myArray" 0 2 2
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "c"  ]
  [ "${myArray[1]}" == "d"  ]
  [ "${myArray[2]}" == "a"  ]
  [ "${myArray[3]}" == "b"  ]
  [ "${myArray[4]}" == "e"  ]

  myArray=("a" "b" "c" "d" "e")
  ArrayUtils.swap "myArray" 1 3 3
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "d"  ]
  [ "${myArray[2]}" == "e"  ]
  [ "${myArray[3]}" == "b"  ]
  [ "${myArray[4]}" == "c"  ]
}

@test "swap succeed even when indexes are not in the bounds" {
  myArray=("a" "b" "c" "d")
  ArrayUtils.swap "myArray" 0 10
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "d"  ]

  myArray=("a" "b" "c" "d")
  ArrayUtils.swap "myArray" -1 2
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "c"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "a"  ]
  [ "${myArray[3]}" == "d"  ]

  myArray=("a" "b" "c" "d")
  ArrayUtils.swap "myArray" -1 10
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "d"  ]

  myArray=("a" "b" "c" "d")
  ArrayUtils.swap "myArray" 0 2 10
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "c"  ]
  [ "${myArray[1]}" == "d"  ]
  [ "${myArray[2]}" == "a"  ]
  [ "${myArray[3]}" == "b"  ]
}

@test "swap fails when the indexes are not numbers" {

  myArray=("a" "b" "c" "d")
  run ArrayUtils.swap "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.swap "myArray" "1" "b"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.swap "myArray" "c" "d"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

    run ArrayUtils.swap "myArray" "1" "2" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}