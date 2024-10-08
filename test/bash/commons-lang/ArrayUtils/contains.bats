#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.contains


@test "contains fails when the input name does not refere to an array" {
  run ArrayUtils.contains
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.contains ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.contains "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.contains " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.contains "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.contains "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run ArrayUtils.contains "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "contains succeed when reference is an array and value is present in the array" {
  local myArray=("a" "b" "" "c")
  ArrayUtils.contains "myArray" "b"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == ""   ]
  [ "${myArray[3]}" == "c"  ]
}

@test "contains fails when the value is not present into the array" {
  local myArray=("a" "b" "" "c")
  run ArrayUtils.contains "myArray" "d"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == ""   ]
  [ "${myArray[3]}" == "c"  ]

    run ArrayUtils.contains "myArray" "a b"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == ""   ]
  [ "${myArray[3]}" == "c"  ]
}

@test "contains fails when no value or more than 1 value is provided" {
  local myArray=("a" "b" "" "c")
  run ArrayUtils.contains "myArray"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == ""   ]
  [ "${myArray[3]}" == "c"  ]
  
  run ArrayUtils.contains "myArray" "c" "d"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == ""   ]
  [ "${myArray[3]}" == "c"  ]
}
