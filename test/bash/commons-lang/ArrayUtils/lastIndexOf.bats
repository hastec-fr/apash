#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.lastIndexOf
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "ArrayUtils.lastIndexOf fails when the inputs do not refere to an array" {
  run ArrayUtils.lastIndexOf
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.lastIndexOf ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.lastIndexOf "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.lastIndexOf " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.lastIndexOf "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myArray=("a" "b")
  run ArrayUtils.lastIndexOf "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.lastIndexOf  "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.lastIndexOf "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "ArrayUtils.lastIndexOf succeed when references are arrays and value is present" {
  local myArray=("a" "b" "" "c" "b")
  run ArrayUtils.lastIndexOf "myArray" "b"
  [ "$status" -eq 0  ]
  [ "$output" = "4"  ]

  myArray=("a" "b")
  run ArrayUtils.lastIndexOf "myArray" "a" "-1"
  [ "$status" -eq 0  ]
  [ "$output" = "0"  ]

  myArray=("a" "" "b")
  run ArrayUtils.lastIndexOf "myArray" "" "1"
  [ "$status" -eq 0  ]
  [ "$output" = "1"  ]
}

@test "ArrayUtils.lastIndexOf returns ArrayUtils_INDEX_NOT_FOUND when value is not present" {
  myArray=("a" "b")
  run ArrayUtils.lastIndexOf "myArray" "c"
  [ "$status" -eq 1   ]
  [ "$output" = "-1"  ]

  myArray=("a" "b")
  run ArrayUtils.lastIndexOf "myArray" "a" "3"
  [ "$status" -eq 1   ]
  [ "$output" = "-1"  ]

  myArray=("a" "b")
  run ArrayUtils.lastIndexOf "myArray" ""
  [ "$status" -eq 1   ]
  [ "$output" = "-1"  ]
}
