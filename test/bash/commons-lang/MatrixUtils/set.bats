#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.MatrixUtils.set
apash.import fr.hastec.apash.commons-lang.MatrixUtils.create

@test "set fails when the input name does not refere to a matrix or not have enough dimensions." {
  run MatrixUtils.set
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.set ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.set "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.set " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  run MatrixUtils.set "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.set "myArray" "0" "9"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run MatrixUtils.set "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run MatrixUtils.set "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "set succeed when reference is a two dimensionals matrix" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 3 3
  MatrixUtils.set myMatrix a 0 0
  [ "${#myMatrix[@]}" = 9 ]
  [ "${myMatrix[0]}" = "a" ]
  [ "${myMatrix[1]}" = "2" ]
  [ "${myMatrix[2]}" = "3" ]
  [ "${myMatrix[3]}" = "4" ]
  [ "${myMatrix[4]}" = "5" ]
  [ "${myMatrix[5]}" = "6" ]
  [ "${myMatrix[6]}" = "7" ]
  [ "${myMatrix[7]}" = "8" ]
  [ "${myMatrix[8]}" = "9" ]

  MatrixUtils.set myMatrix b 0 2
  [ "${#myMatrix[@]}" = 9 ]
  [ "${myMatrix[0]}" = "a" ]
  [ "${myMatrix[1]}" = "2" ]
  [ "${myMatrix[2]}" = "b" ]
  [ "${myMatrix[3]}" = "4" ]
  [ "${myMatrix[4]}" = "5" ]
  [ "${myMatrix[5]}" = "6" ]
  [ "${myMatrix[6]}" = "7" ]
  [ "${myMatrix[7]}" = "8" ]
  [ "${myMatrix[8]}" = "9" ]


  MatrixUtils.set myMatrix c 1 1
  [ "${#myMatrix[@]}" = 9 ]
  [ "${myMatrix[0]}" = "a" ]
  [ "${myMatrix[1]}" = "2" ]
  [ "${myMatrix[2]}" = "b" ]
  [ "${myMatrix[3]}" = "4" ]
  [ "${myMatrix[4]}" = "c" ]
  [ "${myMatrix[5]}" = "6" ]
  [ "${myMatrix[6]}" = "7" ]
  [ "${myMatrix[7]}" = "8" ]
  [ "${myMatrix[8]}" = "9" ]
}

@test "set fails when indexes are out of bounds" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 3 3
  run MatrixUtils.set myMatrix a 3 0
  [ "$status" -eq 1 ]
  [ "${#myMatrix[@]}" = 9 ]
  [ "${myMatrix[0]}" = "1" ]
  [ "${myMatrix[1]}" = "2" ]
  [ "${myMatrix[2]}" = "3" ]
  [ "${myMatrix[3]}" = "4" ]
  [ "${myMatrix[4]}" = "5" ]
  [ "${myMatrix[5]}" = "6" ]
  [ "${myMatrix[6]}" = "7" ]
  [ "${myMatrix[7]}" = "8" ]
  [ "${myMatrix[8]}" = "9" ]
}
