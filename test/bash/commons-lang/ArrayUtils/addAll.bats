#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.addAll


@test "addAll fails when the input name does not refere to an array" {
  run ArrayUtils.addAll
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.addAll ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.addAll "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.addAll " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.addAll "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run ArrayUtils.addAll "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "addAll succeed when reference is an array and at least 1 one value is provided" {
  local myArray=()
  ArrayUtils.addAll "myArray" "a"
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" == "a"  ]

  myArray=("a")
  ArrayUtils.addAll "myArray" "foo bar"
  [ "${#myArray[@]}" -eq 2  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "foo bar"  ]

  myArray=("a" "foo bar")
  ArrayUtils.addAll "myArray" ""
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "foo bar"  ]
  [ "${myArray[2]}" == ""  ]

  myArray=("a" "b")
  ArrayUtils.addAll "myArray" "c" "d"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "d"  ]

  myArray=("a" "b")
  local otArray=("c" "d")
  ArrayUtils.addAll "myArray" ${otArray[@]}
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == "c"  ]
  [ "${myArray[3]}" == "d"  ]
}

@test "addAll succeed and force input transformation" {
  unset myArray
  ArrayUtils.addAll "myArray" "a"
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" == "a"  ]


}

@test "addAll fails when no value is provided" {
  local myArray=("a" "b")
  run ArrayUtils.addAll "myArray"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 2  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
}
