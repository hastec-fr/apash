#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndexValid


@test "isArrayIndexValid fails when the inputs do not refere to an array or index not provided" {
  run ArrayUtils.isArrayIndexValid
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isArrayIndexValid ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isArrayIndexValid "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isArrayIndexValid " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isArrayIndexValid "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myArray=("a" "b")
  run ArrayUtils.isArrayIndexValid "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.isArrayIndexValid  "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.isArrayIndexValid "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "isArrayIndexValid succeed when the references is an arrays and index exists" {
  myArray=("a" "b" "" "c" "b")
  run ArrayUtils.isArrayIndexValid "myArray" "1"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  myArray=("a" "" "b")
  run ArrayUtils.isArrayIndexValid "myArray" "1"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  myArray=("a" "" "b")
  run ArrayUtils.isArrayIndexValid "myArray" "$((${#myArray}-1))"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]
}

@test "isArrayIndexValid fails when index is out of range" {
  myArray=("a" "b")
  run ArrayUtils.isArrayIndexValid "myArray" "3"
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]

  myArray=("a" "b")
  run ArrayUtils.isArrayIndexValid "myArray" "-1"
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]
}
