#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeElement

# min #########################################
@test "removeElement fails when the input does not refer to an array" {
  run ArrayUtils.removeElement
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeElement ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeElement "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeElement " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeElement "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myArray=("a" "b")
  run ArrayUtils.removeElement "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.removeElement  "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.removeElement "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "removeElement succeed when the reference is an array" {
  myArray=("a" "b" "a" "c" "" "d")
  ArrayUtils.removeElement "myArray" "a"
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "b"  ]
  [ "${myArray[1]}" == "a"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

 ArrayUtils.removeElement "myArray" "a"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "b"  ]
  [ "${myArray[1]}" == "c"  ]
  [ "${myArray[2]}" == ""   ]
  [ "${myArray[3]}" == "d"  ]

  ArrayUtils.removeElement "myArray" ""
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "b"  ]
  [ "${myArray[1]}" == "c"  ]
  [ "${myArray[2]}" == "d"  ]

  ArrayUtils.removeElement "myArray" "e"
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "b"  ]
  [ "${myArray[1]}" == "c"  ]
  [ "${myArray[2]}" == "d"  ]

  myArray=("a")
  ArrayUtils.removeElement "myArray" "a"
  [ "${#myArray[@]}" -eq 0  ]

  ArrayUtils.removeElement "myArray" "a"
  [ "${#myArray[@]}" -eq 0  ]
}
