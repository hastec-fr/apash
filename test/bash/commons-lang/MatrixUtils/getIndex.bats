#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getIndex
apash.import fr.hastec.apash.commons-lang.MatrixUtils.create

# min #########################################
@test "getIndex fails when the input name does not refere to a matrix" {
  run MatrixUtils.getIndex
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getIndex ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getIndex "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getIndex " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  run MatrixUtils.getIndex "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run MatrixUtils.getIndex "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run MatrixUtils.getIndex "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "getIndex succeed when reference is a matrix" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 3 3
  run MatrixUtils.getIndex "myMatrix" 0 1
  [ "$status" -eq 0  ]
  [ "$output" = "1"  ]

  run MatrixUtils.getIndex "myMatrix" 1 0
  [ "$status" -eq 0  ]
  [ "$output" = "3"  ]

  run MatrixUtils.getIndex "myMatrix" "1"
  [ "$status" -eq 0  ]
  [ "$output" = "3"  ]

  run MatrixUtils.getIndex "myMatrix" 1 2
  [ "$status" -eq 0  ]
  [ "$output" = "5"  ]

  run MatrixUtils.getIndex "myMatrix" 2 1
  [ "$status" -eq 0  ]
  [ "$output" = "7"  ]

}

@test "getIndex fails when indexes are out of bound" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 3 3
  run MatrixUtils.getIndex "myMatrix" 1 4
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]

  run MatrixUtils.getIndex "myMatrix" 3 1
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]
}