#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.get


@test "contains fails when the input name does not refere to an array" {
  run ArrayUtils.get
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.get ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.get "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.get " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.get "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.get "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run ArrayUtils.get "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "get succeed when reference is an array and index exists" {
  local myArray=("a" "b" "" "c")
  run ArrayUtils.get "myArray" "0"
  [ "$status" -eq 0  ]
  [ "$output" = "a"  ]

  run ArrayUtils.get "myArray" "3"
  [ "$status" -eq 0  ]
  [ "$output" = "c"  ]
}

@test "get fails when index is not present into the array" {
  local myArray=("a" "b" "" "c")
  run ArrayUtils.get "myArray" "-1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.get "myArray" "5"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ] 
}

@test "get succeed when index is out of bound but a default value is provided" {
  local myArray=("a" "b" "" "c")
  run ArrayUtils.get "myArray" "-1" " "
  [ "$status" -eq 0 ]
  [ "$output" = " "  ] 
  
  run ArrayUtils.get "myArray" "5" "foo bar"
  [ "$status" -eq 0 ]
  [ "$output" = "foo bar" ]
}
