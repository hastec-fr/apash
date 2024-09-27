#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.shuffle

# min #########################################
@test "shuffle fails when the input does not refer to an array" {
  run ArrayUtils.shuffle
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.shuffle ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.shuffle " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myVar="dummy"
  run ArrayUtils.shuffle "$myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.shuffle "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]  

  declare -A myMap
  run ArrayUtils.shuffle  "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.shuffle "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "shuffle succeed when the reference is an array" {
  myArray=("a" "b" "c" "d")
  ArrayUtils.shuffle "myArray"
  [ "${#myArray[@]}" -eq 4  ]
  [[ " ${myArray[@]} " =~ " a "  ]]
  [[ " ${myArray[@]} " =~ " b "  ]]
  [[ " ${myArray[@]} " =~ " c "  ]]
  [[ " ${myArray[@]} " =~ " d "  ]]

  myArray=("a")
  ArrayUtils.shuffle "myArray"
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" = "a"  ]

  myArray=()
  ArrayUtils.shuffle "myArray"
  [ "${#myArray[@]}" -eq 0  ]
}
