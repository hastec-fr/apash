#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeDuplicates
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "ArrayUtils.removeDuplicates fails when the inputs do not refere to an array" {
  run ArrayUtils.removeDuplicates
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeDuplicates ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeDuplicates "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeDuplicates " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeDuplicates "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.removeDuplicates  "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.removeDuplicates "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "ArrayUtils.remove succeed when the reference is an arrays the index is valid" {
  myArray=("a" "b" "a" "c")
  ArrayUtils.removeDuplicates "myArray"
  [ "${#myArray[@]}" -eq 3 ]
  [ "${myArray[0]}" == "a" ]
  [ "${myArray[1]}" == "b" ]
  [ "${myArray[2]}" == "c" ]

  myArray=()
  ArrayUtils.removeDuplicates "myArray"
  [ "${#myArray[@]}" -eq 0 ]

  myArray=("a" "b" "c" "d")
  ArrayUtils.removeDuplicates "myArray"
  [ "${#myArray[@]}" -eq 4 ]
  [ "${myArray[0]}" == "a" ]
  [ "${myArray[1]}" == "b" ]
  [ "${myArray[2]}" == "c" ]
  [ "${myArray[3]}" == "d" ]
}

