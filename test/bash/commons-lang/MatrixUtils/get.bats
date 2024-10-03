#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.MatrixUtils.get
apash.import fr.hastec.apash.commons-lang.MatrixUtils.create

# min #########################################
@test "get fails when the input name does not refere to a matrix or not have enough dimensions." {
  run MatrixUtils.get
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.get ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.get "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.get " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  run MatrixUtils.get "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.get "myArray" "0" "9"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run MatrixUtils.get "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run MatrixUtils.get "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "get succeed when reference is a two dimensionals matrix" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 3 3
  run MatrixUtils.get myMatrix 
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]

  run MatrixUtils.get myMatrix 0
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]

  run MatrixUtils.get myMatrix 0 0
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]

  run MatrixUtils.get myMatrix 1 1
  [ "$status" -eq 0 ]
  [ "$output" = "5" ]
}

@test "get succeed when reference is a three dimensionals matrix" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 2 2 2
  run MatrixUtils.get myMatrix 
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]

  run MatrixUtils.get myMatrix 0
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]

  run MatrixUtils.get myMatrix 1 1
  [ "$status" -eq 0 ]
  [ "$output" = "7" ]

  run MatrixUtils.get myMatrix 0 0 0
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]

  run MatrixUtils.get myMatrix 0 1 0
  [ "$status" -eq 0 ]
  [ "$output" = "3" ]
}

@test "get fails when indexes are out of bound" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 2 2 2
  run MatrixUtils.get myMatrix 0 2 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}