#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.MatrixUtils.create

# min #########################################
@test "create fails when the input name does not refere to a matrix or not have enough dimensions." {
  run MatrixUtils.create
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.create ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.create "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.create " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  run MatrixUtils.create "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.create "myArray" "0" "9"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run MatrixUtils.create "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run MatrixUtils.create "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "create succeed when reference is a two dimensional matrix" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 3 3
  [ "${#_apash_matrix_dim_myMatrix[@]}" -eq 2  ]
  [ "${_apash_matrix_dim_myMatrix[0]}" == "3"  ]
  [ "${_apash_matrix_dim_myMatrix[1]}" == "3"  ]

  # 1 cell remains not taken into account.
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 2 2 2 
  [ "${#_apash_matrix_dim_myMatrix[@]}" -eq 3  ]
  [ "${_apash_matrix_dim_myMatrix[0]}" == "2"  ]
  [ "${_apash_matrix_dim_myMatrix[1]}" == "2"  ]
  [ "${_apash_matrix_dim_myMatrix[2]}" == "2"  ]
}
