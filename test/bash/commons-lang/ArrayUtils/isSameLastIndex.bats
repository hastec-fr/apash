#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.isSameLastIndex
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "isSameLastIndex fails when the input do not refere to an array" {
  run ArrayUtils.isSameLastIndex
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSameLastIndex "" ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSameLastIndex "myVar" "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSameLastIndex " " " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSameLastIndex "myArray" "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.isSameLastIndex "myMap" "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.isSameLastIndex "myMap" "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local myArray=()
  run ArrayUtils.isSameLastIndex "myArray" ""
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]
}

@test "isSameLastIndex succeed when the input arrays have the same last index" {
  local myArray=()
  run ArrayUtils.isSameLastIndex "myArray" "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  myArray1=("a")
  myArray2=("b")
  run ArrayUtils.isSameLastIndex "myArray1" "myArray2"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]
}

@test "isSameLastIndex fails when the input arrays does not have the same last index" {
  myArray1=("a")
  myArray2=("a" "b")
  run ArrayUtils.isSameLastIndex "myArray1" "myArray2"
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]

  myArray1=("a")
  myArray2=("a" "b")
  myArray1[10]=z
  run ArrayUtils.isSameLastIndex "myArray1" "myArray2"
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]
}
