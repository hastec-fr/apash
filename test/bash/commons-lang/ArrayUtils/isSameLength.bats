#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isSameLength

# min #########################################
@test "isSameLength fails when the input do not refere to an array" {
  run ArrayUtils.isSameLength
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSameLength "" ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSameLength "myVar" "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSameLength " " " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSameLength "myArray" "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.isSameLength "myMap" "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.isSameLength "myMap" "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=()
  run ArrayUtils.isSameLength "myArray" ""
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]
}

@test "isSameLength succeed when the input arrays have the same length" {
  local myArray=()
  run ArrayUtils.isSameLength "myArray" "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  myArray1=("a")
  myArray2=("b")
  run ArrayUtils.isSameLength "myArray1" "myArray2"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]
}

@test "isSameLength fails when the input arrays does not have the same length" {
  myArray1=("a")
  myArray2=("a" "b")
  run ArrayUtils.isSameLength "myArray1" "myArray2"
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]
}
