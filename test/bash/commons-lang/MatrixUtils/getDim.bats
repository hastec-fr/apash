#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getDim
apash.import fr.hastec.apash.commons-lang.MatrixUtils.create

# min #########################################
@test "getDim fails when the input name does not refere to a matrix" {
  run MatrixUtils.getDim
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getDim ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getDim "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getDim " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  run MatrixUtils.getDim "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run MatrixUtils.getDim "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run MatrixUtils.getDim "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "getDim succeed when reference is a two dimensional matrix" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  local mySubArray=()
  MatrixUtils.create myMatrix 3 3
  MatrixUtils.getDim "mySubArray" "myMatrix" "0" "1"
  [ "${#mySubArray[@]}" -eq 1  ]
  [ "${mySubArray[0]}" == "2"  ]

  local mySubArray=()
  MatrixUtils.getDim "mySubArray" "myMatrix" "1" "1"
  [ "${#mySubArray[@]}" -eq 1  ]
  [ "${mySubArray[0]}" == "5"  ]

  local mySubArray=()
  MatrixUtils.getDim "mySubArray" "myMatrix" "0"
  [ "${#mySubArray[@]}" -eq 3  ]
  [ "${mySubArray[0]}" == "1"  ]
  [ "${mySubArray[1]}" == "2"  ]
  [ "${mySubArray[2]}" == "3"  ]

  local mySubArray=()
  MatrixUtils.getDim "mySubArray" "myMatrix" "1"
  [ "${#mySubArray[@]}" -eq 3  ]
  [ "${mySubArray[0]}" == "4"  ]
  [ "${mySubArray[1]}" == "5"  ]
  [ "${mySubArray[2]}" == "6"  ]

  local mySubArray=()
  MatrixUtils.getDim "mySubArray" "myMatrix"
  [ "${#mySubArray[@]}" -eq 9  ]
  [ "${mySubArray[0]}" == "1"  ]
  [ "${mySubArray[1]}" == "2"  ]
  [ "${mySubArray[2]}" == "3"  ]
  [ "${mySubArray[3]}" == "4"  ]
  [ "${mySubArray[4]}" == "5"  ]
  [ "${mySubArray[5]}" == "6"  ]
  [ "${mySubArray[6]}" == "7"  ]
  [ "${mySubArray[7]}" == "8"  ]
  [ "${mySubArray[8]}" == "9"  ]
}

@test "getDim succeed when reference is a three dimensional matrix" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8")
  local mySubArray=()
  MatrixUtils.create myMatrix 2 2 2
  MatrixUtils.getDim "mySubArray" "myMatrix" "0" "1" "0"
  [ "${#mySubArray[@]}" -eq 1  ]
  [ "${mySubArray[0]}" == "3"  ]

  local mySubArray=()
  MatrixUtils.getDim "mySubArray" "myMatrix" "1" "1" 
  [ "${#mySubArray[@]}" -eq 2  ]
  [ "${mySubArray[0]}" == "7"  ]
  [ "${mySubArray[1]}" == "8"  ]

  MatrixUtils.getDim "mySubArray" "myMatrix" "0"
  [ "${#mySubArray[@]}" -eq 4  ]
  [ "${mySubArray[0]}" == "1"  ]
  [ "${mySubArray[1]}" == "2"  ]
  [ "${mySubArray[2]}" == "3"  ]
  [ "${mySubArray[3]}" == "4"  ]
}

