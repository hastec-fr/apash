#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.shift


@test "shift fails when the input does not refer to an array" {
  run ArrayUtils.shift
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.shift ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.shift " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myVar="dummy"
  run ArrayUtils.shift "$myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.shift "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]  

  declare -A myMap
  run ArrayUtils.shift  "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.shift "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "shift succeed when the reference is an array" {
  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray"
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" "${#myArray[@]}"
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" "1" "3"
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "d"  ]
  [ "${myArray[4]}" == ""   ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" 2
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == ""   ]
  [ "${myArray[1]}" == "d"  ]
  [ "${myArray[2]}" == "a"  ]
  [ "${myArray[3]}" == "b"  ]
  [ "${myArray[4]}" == "c"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" 1 1 3
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "c"  ]
  [ "${myArray[2]}" == "b"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]
}

@test "shift succeed even when indexes are not in the bounds" {
  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" -1
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]
  [ "${myArray[0]}" == "a"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" -1 10
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" 0 10
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" 5 4
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" 10 15
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" 4 4
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" 3 4
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.shift "myArray" 1 1 10
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "d"  ]
  [ "${myArray[2]}" == "b"  ]
  [ "${myArray[3]}" == "c"  ]
  [ "${myArray[4]}" == ""   ]
}

@test "shift fails when the indexes are not numbers" {
  myArray=("a" "b" "c" "" "d")
  run ArrayUtils.shift "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.shift "myArray" "1" "b"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.shift "myArray" "c" "d"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.shift "myArray" "1" "1" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}