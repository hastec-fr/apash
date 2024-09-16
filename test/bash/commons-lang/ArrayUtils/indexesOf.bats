#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.indexesOf

# min #########################################
@test "indexesOf fails when the inputs do not refere to an array" {
  run ArrayUtils.indexesOf
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.indexesOf ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.indexesOf "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.indexesOf " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.indexesOf "myIndexes" "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -a myIndexes
  declare -A myMap
  run ArrayUtils.indexesOf "myIndexes" "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myMap=(["foo"]="a")
  run ArrayUtils.indexesOf "myIndexes" "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "indexesOf succeed when references are arrays" {
  local myIndexes=()
  local myArray=("a" "b" "" "c" "b")
  ArrayUtils.indexesOf "myIndexes" "myArray" "b"
  [ "${#myIndexes[@]}" -eq 2  ]
  [ "${myIndexes[0]}" == "1"  ]
  [ "${myIndexes[1]}" == "4"  ]

  myIndexes=()
  myArray=("a" "b")
  ArrayUtils.indexesOf "myIndexes" "myArray" "c"
  [ "${#myIndexes[@]}" -eq 0  ]

  myIndexes=("1" "2")
  myArray=("a" "b")
  ArrayUtils.indexesOf "myIndexes" "myArray" "a" "3"
  [ "${#myIndexes[@]}" -eq 0  ]

  myIndexes=("1" "2")
  myArray=("a" "b")
  ArrayUtils.indexesOf "myIndexes" "myArray" "a" "-1"
  [ "${#myIndexes[@]}" -eq 1  ]
  [ "${myIndexes[0]}" == "0"  ]
}

