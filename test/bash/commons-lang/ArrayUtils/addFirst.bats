#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.addFirst
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "ArrayUtils.addFirst fails when the input name does not refere to an array" {
  run ArrayUtils.addFirst
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.addFirst ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.addFirst "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.addFirst " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.addFirst "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run ArrayUtils.addFirst "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "ArrayUtils.addFirst succeed and force input transformation" {
  unset myArray
  ArrayUtils.addFirst "myArray" "a"
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" == "a"  ]

}

@test "ArrayUtils.addFirst succeed when reference is an array and a value is declared" {
  local myArray=()
  ArrayUtils.addFirst "myArray" "a"
  [ "${#myArray[@]}" -eq 1  ]
  [ "${myArray[0]}" == "a"  ]

  myArray=("a")
  ArrayUtils.addFirst "myArray" "foo bar"
  [ "${#myArray[@]}" -eq 2  ]
  [ "${myArray[0]}" == "foo bar"  ]
  [ "${myArray[1]}" == "a"  ]

  myArray=("foo bar" "a")
  ArrayUtils.addFirst "myArray" ""
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == ""  ]
  [ "${myArray[1]}" == "foo bar"  ]
  [ "${myArray[2]}" == "a"  ]
}

@test "ArrayUtils.addFirst fails when more than 1 value is provided" {
  local myArray=("a" "b")
  run ArrayUtils.addFirst "myArray"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 2 ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  
  run ArrayUtils.addFirst "myArray" "c" "d"
  [ "$status" -eq 1 ]
  [ "${#myArray[@]}" -eq 2  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
}
