#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.join

# min #########################################
@test "join fails when the input name does not refere to an array" {
  run ArrayUtils.join
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.join ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.join "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.join " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.join "myArray" "1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.join "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="bar")
  run ArrayUtils.join "myMap" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "join succeed when reference is an array" {
  local myArray=("a" "b" "" "c")
  run ArrayUtils.join "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = "a b  c"  ]

  run ArrayUtils.join "myArray" ","
  [ "$status" -eq 0  ]
  [ "$output" = "a,b,,c"  ]

  run ArrayUtils.join "myArray" "|1|"
  [ "$status" -eq 0  ]
  [ "$output" = "a|1|b|1||1|c"  ]
}
