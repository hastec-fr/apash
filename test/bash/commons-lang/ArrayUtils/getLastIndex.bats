#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "getLastIndex fails when the inputs do not refere to an array" {
  run ArrayUtils.getLastIndex
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.getLastIndex ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.getLastIndex "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.getLastIndex " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.getLastIndex "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.getLastIndex "myMap" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "getLastIndex succeed and return empty string when the array is empty" {
  myArray=()
  run ArrayUtils.getLastIndex "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]
}

@test "getLastIndex succeed when references are arrays and value is present" {
  local myArray=("a" "b" "" "c" "b")
  run ArrayUtils.getLastIndex "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = "4"  ]

  myArray=("")
  run ArrayUtils.getLastIndex "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = "0"  ]

  myArray=("a" "b" "" "c")
  myArray[9223372036854775807]=z
  run ArrayUtils.getLastIndex "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = "9223372036854775807"  ]
}
