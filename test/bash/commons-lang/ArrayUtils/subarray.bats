#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.subarray
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "subarray fails when the input does not refer to an array" {
  run ArrayUtils.subarray
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.subarray ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.subarray " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myVar="dummy"
  myArray=()
  run ArrayUtils.subarray "$myVar" "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myArray=()
  run ArrayUtils.subarray "mySubArray" "myArray" "0" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.subarray  "myMap" "myArray" "0" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.subarray "myMap" "myArray" "0" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "subarray succeed when the reference is an array and indices valid positive integers" {
  mySubArray=()
  myArray=("a" "b" "c" "d")
  ArrayUtils.subarray "mySubArray" "myArray" 0 2
  [ "${#mySubArray[@]}" -eq 2  ]
  [ "${mySubArray[0]}" == "a"  ]
  [ "${mySubArray[1]}" == "b"  ]

  mySubArray=()
  myArray=("a" "b" "c" "d")
  ArrayUtils.subarray "mySubArray" "myArray" 0 0
  [ "${#mySubArray[@]}" -eq 0  ]

  mySubArray=()
  myArray=("a" "b" "c" "d")
  ArrayUtils.subarray "mySubArray" "myArray" 3 4
  [ "${#mySubArray[@]}" -eq 1  ]
  [ "${mySubArray[0]}" == "d"  ]
}

@test "subarray succeed even when indexes are not in the bounds" {
  mySubArray=()
  myArray=("a" "b" "c" "d")
  ArrayUtils.subarray "mySubArray" "myArray" 0 10
  [ "${#mySubArray[@]}" -eq 4  ]
  [ "${mySubArray[0]}" == "a"  ]
  [ "${mySubArray[1]}" == "b"  ]
  [ "${mySubArray[2]}" == "c"  ]
  [ "${mySubArray[3]}" == "d"  ]

  mySubArray=()
  myArray=("a" "b" "c" "d")
  ArrayUtils.subarray "mySubArray" "myArray" -1 2
  [ "${#mySubArray[@]}" -eq 2  ]
  [ "${mySubArray[0]}" == "a"  ]
  [ "${mySubArray[1]}" == "b"  ]

  mySubArray=()
  myArray=("a" "b" "c" "d")
  ArrayUtils.subarray "mySubArray" "myArray" -1 10
  [ "${#mySubArray[@]}" -eq 4  ]
  [ "${mySubArray[0]}" == "a"  ]
  [ "${mySubArray[1]}" == "b"  ]
  [ "${mySubArray[2]}" == "c"  ]
  [ "${mySubArray[3]}" == "d"  ]

  mySubArray=()
  myArray=("a" "b" "c" "d")
  ArrayUtils.subarray "mySubArray" "myArray" 3 2
  [ "${#mySubArray[@]}" -eq 0  ]

  mySubArray=()
  myArray=("a" "b" "c" "d")
  ArrayUtils.subarray "mySubArray" "myArray" -2 -1
  [ "${#mySubArray[@]}" -eq 0  ]

  mySubArray=()
  myArray=("a" "b" "c" "d")
  ArrayUtils.subarray "mySubArray" "myArray" 10 11
  [ "${#mySubArray[@]}" -eq 0  ]
}

@test "subarray fails when the indexes are not numbers" {
  mySubArray=()
  myArray=("a" "b" "c" "d")
  run ArrayUtils.subarray "mySubArray" "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  [ "${#mySubArray[@]}" -eq 0  ]

  mySubArray=()
  myArray=("a" "b" "c" "d")
  run ArrayUtils.subarray "mySubArray" "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  [ "${#mySubArray[@]}" -eq 0  ]

  mySubArray=()
  myArray=("a" "b" "c" "d")
  run ArrayUtils.subarray "mySubArray" "myArray" "1" "b"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  [ "${#mySubArray[@]}" -eq 0  ]

  mySubArray=()
  myArray=("a" "b" "c" "d")
  run ArrayUtils.subarray "mySubArray" "myArray" "c" "d"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  [ "${#mySubArray[@]}" -eq 0  ]
}