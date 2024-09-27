#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.insert

# min #########################################
@test "insert fails when the input name does not refere to an array or index is not a number" {
  run ArrayUtils.insert
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.insert "" "" ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.insert "a" "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.insert " " "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.insert "0" "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.insert "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run ArrayUtils.insert "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "insert succeed when index is a number, reference is an array and values are provided" {
  myArray=()
  ArrayUtils.insert "0" "myArray" "a"
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" == "a"  ]

  ArrayUtils.insert "${#myArray}" "myArray" "b" ""
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == ""   ]

  ArrayUtils.insert "2" "myArray" "c" "d"
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "d"  ]
  [ "${myArray[4]}" == ""   ]

  ArrayUtils.insert "1" "myArray" "foo bar"
  [ "${#myArray[@]}" -eq 6  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "foo bar"  ]
  [ "${myArray[2]}" == "b"  ]
  [ "${myArray[3]}" == "c"  ]
  [ "${myArray[4]}" == "d"  ]
  [ "${myArray[5]}" == ""   ]
}

@test "insert fails if bad index is provided or no value to insert" {
  local myArray=("a" "foo bar" "b" "c" "d" "")
  run ArrayUtils.insert "-1" "myArray" "e"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 6  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "foo bar"  ]
  [ "${myArray[2]}" == "b"  ]
  [ "${myArray[3]}" == "c"  ]
  [ "${myArray[4]}" == "d"  ]
  [ "${myArray[5]}" == ""   ]
  
  run ArrayUtils.insert "1" "myArray"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 6  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "foo bar"  ]
  [ "${myArray[2]}" == "b"  ]
  [ "${myArray[3]}" == "c"  ]
  [ "${myArray[4]}" == "d"  ]
  [ "${myArray[5]}" == ""   ]
}
