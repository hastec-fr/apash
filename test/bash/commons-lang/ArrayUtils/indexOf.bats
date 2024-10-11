#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.indexOf
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "ArrayUtils.indexOf fails when the inputs do not refere to an array" {
  run ArrayUtils.indexOf
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.indexOf ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.indexOf "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.indexOf " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.indexOf "myArray" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myArray=("a" "b")
  run ArrayUtils.indexOf "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.indexOf  "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.indexOf "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "ArrayUtils.indexOf succeed when references are arrays and value is present" {
  local myArray=("a" "b" "" "c" "b")
  run ArrayUtils.indexOf "myArray" "b"
  [ "$status" -eq 0  ]
  [ "$output" = "1"  ]

  myArray=("a" "b")
  run ArrayUtils.indexOf "myArray" "a" "-1"
  [ "$status" -eq 0  ]
  [ "$output" = "0"  ]

  myArray=("a" "" "b")
  run ArrayUtils.indexOf "myArray" "" "1"
  [ "$status" -eq 0  ]
  [ "$output" = "1"  ]
}

@test "ArrayUtils.indexOf returns ArrayUtils_INDEX_NOT_FOUND when value is not present" {
  myArray=("a" "b")
  run ArrayUtils.indexOf "myArray" "c"
  [ "$status" -eq 0   ]
  [ "$output" = "-1"  ]

  myArray=("a" "b")
  run ArrayUtils.indexOf "myArray" "a" "3"
  [ "$status" -eq 0   ]
  [ "$output" = "-1"  ]

  myArray=("a" "b")
  run ArrayUtils.indexOf "myArray" ""
  [ "$status" -eq 0   ]
  [ "$output" = "-1"  ]
}
