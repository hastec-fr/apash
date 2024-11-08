#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.MatrixUtils.setDim
apash.import fr.hastec.apash.commons-lang.MatrixUtils.create

@test "set fails when the input name does not refere to a matrix or not have enough dimensions." {
  run MatrixUtils.setDim
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.setDim ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.setDim "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.setDim " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  run MatrixUtils.setDim "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.setDim "myArray" "0" "9"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run MatrixUtils.setDim "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run MatrixUtils.setDim "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "set succeed when reference is a two dimensionals matrix" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  local myRow=(a b c)
  MatrixUtils.create myMatrix 3 3
  MatrixUtils.setDim myMatrix myRow 1
  [ "${#myMatrix[@]}" = 9 ]
  [ "${myMatrix[0]}" = "1" ]
  [ "${myMatrix[1]}" = "2" ]
  [ "${myMatrix[2]}" = "3" ]
  [ "${myMatrix[3]}" = "a" ]
  [ "${myMatrix[4]}" = "b" ]
  [ "${myMatrix[5]}" = "c" ]
  [ "${myMatrix[6]}" = "7" ]
  [ "${myMatrix[7]}" = "8" ]
  [ "${myMatrix[8]}" = "9" ]

  myRow=(d e)
  MatrixUtils.setDim "myMatrix" "myRow" 2 1
  [ "${#myMatrix[@]}" = 9 ]
  [ "${myMatrix[0]}" = "1" ]
  [ "${myMatrix[1]}" = "2" ]
  [ "${myMatrix[2]}" = "3" ]
  [ "${myMatrix[3]}" = "a" ]
  [ "${myMatrix[4]}" = "b" ]
  [ "${myMatrix[5]}" = "c" ]
  [ "${myMatrix[6]}" = "7" ]
  [ "${myMatrix[7]}" = "d" ]
  [ "${myMatrix[8]}" = "e" ]

  # Keep numbers over the matrix.
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  local myRow=(a b)
  MatrixUtils.create myMatrix 2 2 2
  MatrixUtils.setDim "myMatrix" "myRow" 1 1 0
  [ "${#myMatrix[@]}" = 9 ]
  [ "${myMatrix[0]}" = "1" ]
  [ "${myMatrix[1]}" = "2" ]
  [ "${myMatrix[2]}" = "3" ]
  [ "${myMatrix[3]}" = "4" ]
  [ "${myMatrix[4]}" = "5" ]
  [ "${myMatrix[5]}" = "6" ]
  [ "${myMatrix[6]}" = "a" ]
  [ "${myMatrix[7]}" = "b" ]
  [ "${myMatrix[8]}" = "9" ]
}

@test "setDim fails when the number of element to change overflow the dimension" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  local myRow=(a b c)
  MatrixUtils.create myMatrix 3 3
  run MatrixUtils.setDim myMatrix myRow 2 1
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
