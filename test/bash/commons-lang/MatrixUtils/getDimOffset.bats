#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.MatrixUtils.getDimOffset
apash.import fr.hastec.apash.commons-lang.MatrixUtils.create

# min #########################################
@test "getDimOffset fails when the input name does not refere to a matrix" {
  run MatrixUtils.getDimOffset
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getDimOffset ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getDimOffset "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run MatrixUtils.getDimOffset " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  run MatrixUtils.getDimOffset "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run MatrixUtils.getDimOffset "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run MatrixUtils.getDimOffset "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "getDimOffset succeed when reference is a matrix" {
  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
  MatrixUtils.create myMatrix 3 3
  run MatrixUtils.getDimOffset "myMatrix" "0" "0"
  [ "$status" -eq 0  ]
  [ "$output" = "0"  ]

  run MatrixUtils.getDimOffset "myMatrix" "0"
  [ "$status" -eq 0  ]
  [ "$output" = "3"  ]

  run MatrixUtils.getDimOffset "myMatrix" "1"
  [ "$status" -eq 0  ]
  [ "$output" = "3"  ]

  run MatrixUtils.getDimOffset "myMatrix"
  [ "$status" -eq 0  ]
  [ "$output" = "9"  ]

  local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8")
  MatrixUtils.create myMatrix 2 2 2
  run MatrixUtils.getDimOffset "myMatrix" "0" "0" "1"
  [ "$status" -eq 0  ]
  [ "$output" = "0"  ]

  run MatrixUtils.getDimOffset "myMatrix" "0" "1" 
  [ "$status" -eq 0  ]
  [ "$output" = "2"  ]

  run MatrixUtils.getDimOffset "myMatrix" "0" 
  [ "$status" -eq 0  ]
  [ "$output" = "4"  ]
}

