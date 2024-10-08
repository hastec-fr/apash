#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeAllOccurrences


@test "removeAllOccurrences fails when the input does not refer to an array" {
  run ArrayUtils.removeAllOccurrences
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeAllOccurrences ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeAllOccurrences "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeAllOccurrences " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeAllOccurrences "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myArray=("a" "b")
  run ArrayUtils.removeAllOccurrences "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.removeAllOccurrences  "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.removeAllOccurrences "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "removeAllOccurrences succeed when the reference is an array" {
  myArray=("a" "b" "a" "c" "" "d")
  ArrayUtils.removeAllOccurrences "myArray" "a"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "b"  ]
  [ "${myArray[1]}" == "c"  ]
  [ "${myArray[2]}" == ""   ]
  [ "${myArray[3]}" == "d"  ]

  ArrayUtils.removeAllOccurrences "myArray" ""
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "b"  ]
  [ "${myArray[1]}" == "c"  ]
  [ "${myArray[2]}" == "d"  ]

  myArray=("a")
  ArrayUtils.removeAllOccurrences "myArray" "a"
  [ "${#myArray[@]}" -eq 0  ]

  ArrayUtils.removeAllOccurrences "myArray" "a"
  [ "${#myArray[@]}" -eq 0  ]
}
