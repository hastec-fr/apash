#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeAll
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "removeAll fails when the inputs do not refere to an array" {
  run ArrayUtils.removeAll
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeAll ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeAll "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeAll " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.removeAll "myArray" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myArray=("a" "b")
  run ArrayUtils.removeAll "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.removeAll  "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.removeAll "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "removeAll succeed when the reference is an arrays and indexes are valid" {
  local myArray=("a" "b" "c" "" "d")
  ArrayUtils.removeAll "myArray" "4"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a" ]
  [ "${myArray[1]}" == "b" ]
  [ "${myArray[2]}" == "c" ]
  [ "${myArray[3]}" == ""  ]

  ArrayUtils.removeAll "myArray" "0" "2"  
  [ "${#myArray[@]}" -eq 2 ]
  [ "${myArray[0]}" == "b" ]
  [ "${myArray[1]}" == ""  ]
}

@test "removeAll fails when the index is not present" {
  myArray=("a")
  run ArrayUtils.removeAll "myArray" "4"
  [ "$status" -eq 1   ]
  [ "${#myArray[@]}" -eq 1 ]
  [ "${myArray[0]}" == "a" ]

  myArray=("a")
  run ArrayUtils.removeAll "myArray" "-1"
  [ "$status" -eq 1   ]
  [ "${#myArray[@]}" -eq 1 ]
  [ "${myArray[0]}" == "a" ]

  myArray=()
  run ArrayUtils.removeAll "myArray" "0"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 0 ]
}
