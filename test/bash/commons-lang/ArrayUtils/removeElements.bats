#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeElements

# min #########################################
@test "removeElements fails when the input does not refer to an array" {
  run ArrayUtils.removeElements
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeElements ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeElements "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeElements " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeElements "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myArray=("a" "b")
  run ArrayUtils.removeElements "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.removeElements  "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.removeElements "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "removeElements succeed when the reference is an array" {
  myArray=("a" "b" "a" "c" "" "d")
  ArrayUtils.removeElements "myArray" "a"
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "b"  ]
  [ "${myArray[1]}" == "a"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

 ArrayUtils.removeElements "myArray" "a"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "b"  ]
  [ "${myArray[1]}" == "c"  ]
  [ "${myArray[2]}" == ""   ]
  [ "${myArray[3]}" == "d"  ]

  ArrayUtils.removeElements "myArray" ""
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "b"  ]
  [ "${myArray[1]}" == "c"  ]
  [ "${myArray[2]}" == "d"  ]

  ArrayUtils.removeElements "myArray" "e"
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "b"  ]
  [ "${myArray[1]}" == "c"  ]
  [ "${myArray[2]}" == "d"  ]

  myArray=("a" "b" "a" "c" "" "d")
  ArrayUtils.removeElements "myArray" "a" "a" "d"
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "b"  ]
  [ "${myArray[1]}" == "c"  ]
  [ "${myArray[2]}" == ""   ]

  myArray=("a")
  ArrayUtils.removeElements "myArray" "a"
  [ "${#myArray[@]}" -eq 0  ]

  ArrayUtils.removeElements "myArray" "a"
  [ "${#myArray[@]}" -eq 0  ]
}
