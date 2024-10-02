#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLength

# min #########################################
@test "getLength fails when the input name does not refere to an array" {
  run ArrayUtils.getLength
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.getLength ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.getLength "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.getLength " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.getLength "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.getLength "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run ArrayUtils.getLength "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "getLength succeed when input reference is an array" {
  local myArray=("a" "b" "" "c")
  run ArrayUtils.getLength "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = "4"  ]

  myArray=()
  run ArrayUtils.getLength "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = "0"  ]

  myArray=("a" "b" "" "c")
  myArray[9223372036854775807]=z
  run ArrayUtils.getLength "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = "5"  ]
}
