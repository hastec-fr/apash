#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.clone

# min #########################################
@test "clone fails when the input name does not refere to an array" {
  run ArrayUtils.clone
  [ "$status" -eq 1 ]

  run ArrayUtils.clone ""
  [ "$status" -eq 1 ]

  run ArrayUtils.clone "a"
  [ "$status" -eq 1 ]

  run ArrayUtils.clone " "
  [ "$status" -eq 1 ]

  run ArrayUtils.clone "myArray" "a"
  [ "$status" -eq 1 ]

  declare -A myMap
  run ArrayUtils.clone "myMap" "a"
  [ "$status" -eq 1 ]

  local -A myMap=(["foo"]="bar")
  run ArrayUtils.clone "myMap" "a"
  [ "$status" -eq 1 ]

  local myClone=("a")
  run ArrayUtils.clone "myArray" "myClone"
  [ "$status" -eq 1 ]
  [ "${#myClone[@]}" -eq 1  ]
}

@test "clone succeed when references are arrays" {
  local myArray=()
  local myClone=("a")
  ArrayUtils.clone "myArray" "myClone"
  [ "${#myArray[@]}" -eq 0  ]
  [ "${#myClone[@]}" -eq 0  ]

  myArray=("a" "b" "" "c")
  myClone=("d" "e" "f")
  ArrayUtils.clone "myArray" "myClone"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == ""   ]
  [ "${myArray[3]}" == "c"  ]
  [ "${#myClone[@]}" -eq 4  ]
  [ "${myClone[0]}" == "a"  ]
  [ "${myClone[1]}" == "b"  ]
  [ "${myClone[2]}" == ""   ]
  [ "${myClone[3]}" == "c"  ]

  myArray=("a" "b" "" "c")
  myClone=()
  ArrayUtils.clone "myArray" "myClone"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
  [ "${myArray[2]}" == ""   ]
  [ "${myArray[3]}" == "c"  ]
  [ "${#myClone[@]}" -eq 4  ]
  [ "${myClone[0]}" == "a"  ]
  [ "${myClone[1]}" == "b"  ]
  [ "${myClone[2]}" == ""   ]
  [ "${myClone[3]}" == "c"  ]
}
