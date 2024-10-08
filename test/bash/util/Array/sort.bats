#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.util.Array.sort

# min #########################################
@test "sort fails when the input do not refer to an array" {
  run Array.sort
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Array.sort ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Array.sort " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
 
}

@test "sort transform the wrong reference to empty array " {
  unset myArray
  Array.sort "myArray"
  [ "${#myArray[@]}" -eq 0 ]

  declare -A myMap
  Array.sort "myMap"
  [ "${#myMap[@]}" -eq 0 ]

  unset myMap
  local -A myMap=(["foo"]="a")
  Array.sort "myMap"
  [ "${#myMap[@]}" -eq 0 ]
}

@test "sort succeed when the reference is an array" {
  local myArray=()
  Array.sort "myArray"
  [ "${#myArray[@]}" -eq 0 ]

  myArray=("a" "c" "b")
  Array.sort "myArray"
  [ "${#myArray[@]}" -eq 3 ]
  [ "${myArray[0]}" == "a" ]
  [ "${myArray[1]}" == "b" ]
  [ "${myArray[2]}" == "c" ]

  myArray=("beta-20" "beta-10" "beta-1")
  Array.sort "myArray"
  [ "${#myArray[@]}" -eq 3 ]
  [ "${myArray[0]}" == "beta-1" ]
  [ "${myArray[1]}" == "beta-10" ]
  [ "${myArray[2]}" == "beta-20" ]

  myArray=("1" "a" "2" "3")
  Array.sort "myArray"
  [ "${#myArray[@]}" -eq 4 ]
  [ "${myArray[0]}" == "1" ]
  [ "${myArray[1]}" == "2" ]
  [ "${myArray[2]}" == "3" ]
  [ "${myArray[3]}" == "a" ]

  myArray=("1" "")
  Array.sort "myArray"
  [ "${#myArray[@]}" -eq 2 ]
  [ "${myArray[0]}" == "" ]
  [ "${myArray[1]}" == "1" ]

  myArray=("foo \"bar" "a" "bat man")
  Array.sort "myArray"
  [ "${#myArray[@]}" -eq 3 ]
  [ "${myArray[0]}" == "a" ]
  [ "${myArray[1]}" == "bat man" ]
  [ "${myArray[2]}" == "foo \"bar" ]

  myArray=("this is \nanother text" "this is \na text" "a text")
  Array.sort "myArray"
  [ "${#myArray[@]}" -eq 3 ]
  [ "${myArray[0]}" == "a text" ]
  [ "${myArray[1]}" == "this is \na text" ]
  [ "${myArray[2]}" == "this is \nanother text" ]
  
}

