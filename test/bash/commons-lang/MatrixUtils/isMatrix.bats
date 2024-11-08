#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.MatrixUtils.isMatrix
apash.import fr.hastec.apash.commons-lang.MatrixUtils.create

# min #########################################
@test "isMatrix fails when the input name does not refere to a matrix" {
  run MatrixUtils.isMatrix
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.isMatrix ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.isMatrix "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.isMatrix " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  run MatrixUtils.isMatrix "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run MatrixUtils.isMatrix "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run MatrixUtils.isMatrix "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "isMatrix succeed when reference is a matrix" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 3 3
  run MatrixUtils.isMatrix "myMatrix"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]
}
