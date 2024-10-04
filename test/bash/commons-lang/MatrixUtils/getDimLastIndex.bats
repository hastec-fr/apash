#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getDimLastIndex
apash.import fr.hastec.apash.commons-lang.MatrixUtils.create

# min #########################################
@test "getDimLastIndex fails when the input name does not refere to a matrix" {
  run MatrixUtils.getDimLastIndex
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getDimLastIndex ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getDimLastIndex "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getDimLastIndex " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  run MatrixUtils.getDimLastIndex "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run MatrixUtils.getDimLastIndex "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run MatrixUtils.getDimLastIndex "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "getDimLastIndex succeed when reference is a matrix" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 3 3
  run MatrixUtils.getDimLastIndex "myMatrix" "0" "0"
  [ "$status" -eq 0  ]
  [ "$output" = "2"  ]

  run MatrixUtils.getDimLastIndex "myMatrix" "0"
  [ "$status" -eq 0  ]
  [ "$output" = "2"  ]

  run MatrixUtils.getDimLastIndex "myMatrix" "1"
  [ "$status" -eq 0  ]
  [ "$output" = "5"  ]

  run MatrixUtils.getDimLastIndex "myMatrix"
  [ "$status" -eq 0  ]
  [ "$output" = "8"  ]

  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8")
  MatrixUtils.create myMatrix 2 2 2
  run MatrixUtils.getDimLastIndex "myMatrix" "0" "0" "1"
  [ "$status" -eq 0  ]
  [ "$output" = "1"  ]

  run MatrixUtils.getDimLastIndex "myMatrix" "0" "1" 
  [ "$status" -eq 0  ]
  [ "$output" = "3"  ]

  run MatrixUtils.getDimLastIndex "myMatrix" "0"
  [ "$status" -eq 0  ]
  [ "$output" = "3"  ]

  run MatrixUtils.getDimLastIndex "myMatrix" "1" 
  [ "$status" -eq 0  ]
  [ "$output" = "7"  ]
}

