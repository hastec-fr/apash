#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.reverse
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "ArrayUtils.reverse fails when the input does not refer to an array" {
  run ArrayUtils.reverse
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.reverse ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.reverse " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myVar="dummy"
  run ArrayUtils.reverse "$myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.reverse "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]  

  declare -A myMap
  run ArrayUtils.reverse  "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.reverse "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "ArrayUtils.reverse succeed when the reference is an array" {
  myArray=("a" "b" "c" "d")
  ArrayUtils.reverse "myArray"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "d"  ]
  [ "${myArray[1]}" == "c"  ]
  [ "${myArray[2]}" == "b"  ]
  [ "${myArray[3]}" == "a"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.reverse "myArray"
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "d"  ]
  [ "${myArray[1]}" == ""   ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "b"  ]
  [ "${myArray[4]}" == "a"  ]

  myArray=("a")
  ArrayUtils.reverse "myArray"
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" == "a"  ]

  myArray=()
  ArrayUtils.reverse "myArray"
  [ "${#myArray[@]}" -eq 0  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.reverse "myArray" 2
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "d"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "c"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.reverse "myArray" 1 4
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == ""   ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "b"  ]
  [ "${myArray[4]}" == "d"  ]
}

@test "ArrayUtils.reverse succeed even when indexes are not in the bounds" {
  myArray=("a" "b" "c" "" "d")
  ArrayUtils.reverse "myArray" -1
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "d"  ]
  [ "${myArray[1]}" == ""   ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "b"  ]
  [ "${myArray[4]}" == "a"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.reverse "myArray" -1 10
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "d"  ]
  [ "${myArray[1]}" == ""   ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "b"  ]
  [ "${myArray[4]}" == "a"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.reverse "myArray" 0 10
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "d"  ]
  [ "${myArray[1]}" == ""   ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "b"  ]
  [ "${myArray[4]}" == "a"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.reverse "myArray" 5 4
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.reverse "myArray" 10 15
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.reverse "myArray" 4 4
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == ""   ]
  [ "${myArray[4]}" == "d"  ]

  myArray=("a" "b" "c" "" "d")
  ArrayUtils.reverse "myArray" 3 5
  [ "${#myArray[@]}" -eq 5  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "d"  ]
  [ "${myArray[4]}" == ""   ]
  
}

@test "ArrayUtils.reverse fails when the indexes are not numbers" {

  myArray=("a" "b" "c" "" "d")
  run ArrayUtils.reverse "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.reverse "myArray" "1" "b"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.reverse "myArray" "c" "d"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}